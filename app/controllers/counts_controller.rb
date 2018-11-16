class CountsController < InheritedResources::Base
    before_action :authenticate_user!

   def create
   count = Count.new(count_params)
   count.user_id = current_user.id
    
      if count.save
        redirect_to counts_path
      else
        flash[:error] = "You will need to edit your existing entry not create a new one!"
        redirect_to counts_path
     end
    end
    
    def edit
    @count= Count.find_or_create_by(user_id:current_user.id) do |count|
        count.listeners = 1
      end
     end
     
    def show   
    @count= Count.find_or_create_by(user_id:current_user.id) do |count|
        count.listeners = 1
      end
     end
     
     def index
     
   
     @counts = Count.where('updated_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
       @total_listeners ||= @counts.sum( :listeners )
    end
    
  private

    def count_params
      params.require(:count).permit(:listeners)
    end
end

