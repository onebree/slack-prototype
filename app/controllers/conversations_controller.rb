class ConversationsController < ApplicationController
  def show
    store_location

    @conversation = Conversation.find(params[:id])
    @grouped_messages = @conversation.messages.order(:created_at => :asc).group_by { |m| m.created_at.strftime("%A, %B %-d") }
  end

  def create
    current_user = User.find(1)
    participants = [current_user.id, params[:participant_id].to_i]

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
