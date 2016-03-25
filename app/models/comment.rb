class Comment <ActiveRecord::Base 

	belongs_to :trip
	belongs_to :user
	validates_format_of :url, :with => URI::regexp(%w(http https))

end 