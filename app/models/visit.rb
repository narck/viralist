class Visit < ActiveRecord::Base
	
	belongs_to :store
	belongs_to :user

	validates :visitdate, presence: true
	

	def days_since
		DateTime.now.mjd - visitdate.mjd
	end

	def to_s
		"#{visitdate}, #{store}"
	end

end
