class MeetingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "meeting_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
