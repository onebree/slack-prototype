class MessagesController < ApplicationController
  before_action :logged_in_user

  def index
    @messages = Message.all
    @message = current_user.messages.build
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "room_channel",
                                   :message => render_message(message)
      head :ok
    end
  end

  def mockup
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
    render(:partial => "message", :locals => { :message => message })
  end
end
