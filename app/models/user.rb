class User < Patron
     has_many :messages
     has_one :count
  devise :invitable, :registerable, :confirmable
end
