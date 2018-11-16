class HomeController < ApplicationController
  before_action :authenticate_user!
    before_action :get_messages
  
  
   def index
   
     @count = current_user.count
  
    end
    
     def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end
end
