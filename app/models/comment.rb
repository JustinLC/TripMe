class Comment <ActiveRecord::Base 

	belongs_to :trip
	validates_format_of :url, :with => URI::regexp(%w(http https))

end 