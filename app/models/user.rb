class User < Patron
     has_many :messages
  devise :invitable, :registerable, :confirmable
end
