class MessagesController < ApplicationController
    before_action :authenticate_user!
  before_action :get_messages
  
  
  def show
       render 'index'
  end

  def create
    message = current_user.messages.build(message_params)
    
    if message.save
      ActionCable.server.broadcast 'meeting_channel',
                                   content:  message.content,
                                   username: message.user.email
   
    end
  end

  private

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
