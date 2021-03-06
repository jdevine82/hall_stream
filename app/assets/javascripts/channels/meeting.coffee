App.meeting = App.cable.subscriptions.create "MeetingChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      $('#messages-table').append data.message
      scroll_bottom()


$(document).on 'turbolinks:load', ->

  submit_message()
  scroll_bottom()

 submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      document.getElementsByName('commit')[0].click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)