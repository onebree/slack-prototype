class RoomsController < ApplicationController
  before_action :logged_in_user

  def create
    room = Room.new(room_params)

    if room.save
      current_user.rooms.push room
      redirect_to room_messages_path(room)
    end
  end

  private
  
  def room_params
    params.require(:room).permit(:name)
  end
end
