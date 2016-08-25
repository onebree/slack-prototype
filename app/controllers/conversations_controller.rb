class ConversationsController < ApplicationController
  def show
    store_location

    @conversation = Conversation.find(params[:id])
    @grouped_messages = @conversation.messages.order(:created_at => :asc).group_by { |m| m.created_at.strftime("%A, %B %-d") }
  end
end
