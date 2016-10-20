class RoomUsersController < ApplicationController
  before_action :logged_in_user

  def create
    room = Room.find(params[:room_id])
    room_user = room.room_users.find_or_create_by(:user_id => current_user.id)
    redirect_to room_messages_path(room)
  end

  def destroy
    unless params[:room_id] == 1
      room = Room.find(params[:room_id])
      room.room_users.where(:user_id => current_user.id).destroy_all
    end
    redirect_to room_messages_path(1)
  end
end
