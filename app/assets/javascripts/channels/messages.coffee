$(document).on "turbolinks:load" ->
  messages = $("#messages")

  if messages.length > 0
    App.messages = App.cable.subscriptions.create {
        channel: "MessagesChannel",
        receivable_type: ""
        receivable_id: ""
      },

      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        # Called when there's incoming data on the websocket for this channel

      send_message: (message, receivable_type, receivable_id) ->
        @perform "send_message", message: message, receivable_type: receivable_type, receivable_id: receivable_id
