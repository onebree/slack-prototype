class ConversationsController < ApplicationController
  def show
    store_location

    if logged_in?
      @conversation = Conversation.find(params[:id])
      @grouped_messages = @conversation.messages.order(:created_at => :asc).group_by { |m| m.created_at.strftime("%A, %B %-d") }
    else
      redirect_to login_path
    end
  end

  def create
    participants = [current_user.id, params[:participant_id].to_i].sort

    @conversation = Conversation.find_by_participants(participants[0], participants[1])

    if @conversation
      redirect_to @conversation
    else
      @conversation = Conversation.new(
        :participant_one_id => participants[0],
        :participant_two_id => participants[1]
      )

      if @conversation.save
        redirect_to @conversation
      else
        raise
        # Render last stored location with modal shown
        # Show error message -- must have two participant
      end
    end
  end
end
