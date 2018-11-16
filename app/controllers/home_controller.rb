class HomeController < ApplicationController
  before_action :authenticate_user!
  
   def index
   
     @count = current_user.count
    end
end
