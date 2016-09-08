$(document).on "turbolinks:load" ->
  messages = $("#messages")

  if messages.length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

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
        messages.append data["message"]
        messages_to_bottom()

      send_message: (message, receivable_type, receivable_id) ->
        @perform "send_message", { message: message, receivable_type: receivable_type, receivable_id: receivable_id }

    $("#new_message").on "keypress" (e) ->
      if e && e.keyCode == 13
        e.preventDefault()
        $(this).submit()

    $("#new_message").on "submit" (e) ->
      e.preventDefault()

      body            = $(this).find("#body")
      receivable_type = messages.data("receivable-type")
      receivable_id   = messages.data("receivable-type")

      if $.trim(body.val()).length > 0
        App.messages.send_message(body.val(), receivable_type, receivable_id)
        body.val("")

      return false
