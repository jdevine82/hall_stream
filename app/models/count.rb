class Count < ApplicationRecord
    belongs_to :user
    validates :user, uniqueness: true
    
    def total_listeners
     @total_listeners ||= self.user_id.sum( :listeners )
    end
end
