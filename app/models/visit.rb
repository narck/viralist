class Visit < ActiveRecord::Base
	
	belongs_to :store
	belongs_to :user

	#validates :note, presence: true

	def days_since
		DateTime.now.mjd - visitdate.mjd
	end

end
