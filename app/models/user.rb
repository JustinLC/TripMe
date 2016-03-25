class User <ActiveRecord::Base 

 
	has_and_belongs_to_many :trips
	has_many :comments 

	validates :name, :email, :password,
	presence: true
end 