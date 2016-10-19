# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    message_user.rooms.each do |room|
      stream_from "room_#{room.id}_channel"
      stream_from "room_#{room.id}_channel_user_#{message_user.id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
