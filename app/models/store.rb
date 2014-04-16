class Store < ActiveRecord::Base
	has_many :visits
	has_many :contacts
	belongs_to :company


	def last_visited
		visits.last.days_since_last
	end


	def to_s
		"#{company.name} #{name}"
	end
end
