class MessagesController < ApplicationController
  before_action :logged_in_user

  def index
    @messages = Message.all
    @message = current_user.messages.build
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      redirect_to messages_path
    else
      render "index"
    end
  end

  def mockup
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
