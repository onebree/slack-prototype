class MessagesController < ApplicationController

  def create
    @message = current_user.messages.new(message_params)

    if @message.save
      redirect_to @message.receivable
    else
      Rails.logger.info "Message did not save"
      Rails.logger.info @message.errors.full_messages
      raise
    end
  end

  def message_params
    params.require(:message).permit!
  end
end
