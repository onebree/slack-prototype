class MessagesController < ApplicationController
  before_action :logged_in_user

  def index
    @room     = Room.find(params[:room_id])
    @messages = @room.messages.order(:created_at => :asc)
    @message  = @room.messages.build(:user => current_user)
  end

  def create
    @room = Room.find(params[:room_id])

    message = @room.messages.build(message_params)
    message.user = current_user

    if message.save
      ActionCable.server.broadcast "room_#{@room.id}_channel",
                                   :message => render_message(message),
                                   :room_id => @room.id
      head :ok

      message.mentions.each do |mention|
        ActionCable.server.broadcast "room_#{@room.id}_channel_user_#{mention.id}",
                                     :mention      => true,
                                     :mentioned_by => message.user.username,
                                     :room_name    => @room.name
      end
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
