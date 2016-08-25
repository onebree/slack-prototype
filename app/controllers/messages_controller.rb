class MessagesController < ApplicationController
  def create
    return if params[:body].blank?

    receivable =
      case params[:receivable_type]
      when "Channel"
        Channel.find(params[:receivable_id])
      when "Conversation"
        Conversation.find(params[:receivable_id])
      end

    receivable.messages.create(
      :sender_id => params[:sender_id],
      :body => params[:body]
    )

    redirect_to session[:return_to]
  end
end
