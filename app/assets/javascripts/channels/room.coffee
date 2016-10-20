App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_room = $("#messages[data-room-id='#{data.room_id}']")
    alert("You have a new mention from " + data.mentioned_by + " in #" + data.room_name) if data.mention
    if (data.message && !data.message.blank?)
      active_room.append data.message
      scroll_bottom()

$(document).on "turbolinks:load", ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $("#message_body").on "keydown", (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $("form#new_message").submit()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $("#messages").scrollTop($("#messages")[0].scrollHeight)
