class ConversationsController < ApplicationController
  def show
    store_location

    @conversation = Conversation.find(params[:id])
    @grouped_messages = @conversation.messages.order(:created_at => :asc).group_by { |m| m.created_at.strftime("%A, %B %-d") }
  end

  def create
    @conversation = Conversation.new(:participant_ids => [1, params[:participant_id]])
    if @conversation.save
      redirect_to @conversation
    else
      raise
      # Render last stored location with modal shown
      # Show error message -- must have one participant
    end
  end
end
