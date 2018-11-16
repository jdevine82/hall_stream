class CountsController < InheritedResources::Base
    before_action :authenticate_user!

   def create
   count = Count.new(count_params)
   count.user_id = current_user.id
    
      if count.save
        redirect_to counts_path
      else
        flash[:danger] = "You will need to edit your existing entry not create a new one!"
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
    
  private

    def count_params
      params.require(:count).permit(:listeners)
    end
end

