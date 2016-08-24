class MessagesController < ApplicationController
  def create
    return if params[:body].blank?

    channel = Channel.find(params[:receivable])
    channel.messages.create(
      :sender_id => params[:sender_id],
      :body => params[:body]
    )

    redirect_to channel_path(channel)
  end
end
