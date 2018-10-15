App.meeting = App.cable.subscriptions.create "MeetingChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    
    unless data.content.blank?
      $('#messages-table').append '<div class="message">' +
        '<div class="message-user">' + data.user + ":" + '</div>' +
        '<div class="message-content">' + data.content + '</div>' + '</div>'
