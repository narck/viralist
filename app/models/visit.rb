class Visit < ActiveRecord::Base
	belongs_to :store
	belongs_to :user


	def days_since
		DateTime.now.mjd - visitdate.mjd
	end

end
