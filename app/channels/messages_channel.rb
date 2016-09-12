# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessagesChannel < ApplicationCable::Channel
  def subscribed
    receivable_type = params["receivable_type"]
    receivable_id   = params["receivable_id"]
    stream_from "messages_#{receivable_type}_#{receivable_id}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(
      :body            => data["message"],
      :receivable_type => data["receivable_type"],
      :receivable_id   => data["receivable_id"]
    )
  end
end
