class RoomsController < ApplicationController
  before_action :logged_in_user

  def create
    room = Room.new(room_params)

    if room.save
      room.room_users.create(:user_id => current_user.id)

      respond_to do |format|
        format.html { redirect_to room_messages_path(room) }
        format.js { render :json => room, :status => :created }
      end
    else
      respond_to do |format|
        format.html { redirect_to room_messages_path(1) }
        format.json { render :json => room.errors.full_messages, :status => :unprocessable_entity }
      end
    end
  end

  private
  
  def room_params
    params.require(:room).permit(:name)
  end
end
