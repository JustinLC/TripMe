class Trip <ActiveRecord::Base 

	has_and_belongs_to_many :users
	has_many :comments

	def up_vote
		self.votes += 1
		self.save
	end

end 