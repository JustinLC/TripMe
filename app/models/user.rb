class User <ActiveRecord::Base 

	has_many :trips

	validates :name, :email, :password,
	presence: true
end 