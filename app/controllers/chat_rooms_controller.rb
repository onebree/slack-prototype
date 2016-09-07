class ChatRoomsController < ApplicationController
  def show
    store_location

    if logged_in?
      @chat_room = ChatRoom.find(params[:id])
      @grouped_messages = @chat_room.messages.order(:created_at => :asc).group_by { |m| m.created_at.strftime("%A, %B %-d") }
    else
      redirect_to login_path
    end
  end
end
