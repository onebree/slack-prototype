App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      $("#messages").append data.message

$(document).on "turbolinks:load", ->
  submit_message()

submit_message = () ->
  $("#message_body").on "keydown", (event) ->
    if event.keyCode is 13
      $("form#new_message").submit()
      event.target.value = ""
      event.preventDefault()
