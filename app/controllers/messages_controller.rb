class MessagesController < ApplicationController
  def create
    return if params[:body].blank?

    receivable =
      case params[:receivable_type]
      when "ChatRoom"
        ChatRoom.find(params[:receivable_id])
      when "Conversation"
        Conversation.find(params[:receivable_id])
      end

    receivable.messages.create(
      :sender_id => current_user.id,
      :body => params[:body]
    )

    redirect_to session[:return_to]
  end
end
