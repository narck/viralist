class Company < ActiveRecord::Base
	
	belongs_to :contact
	has_many :contacts
	has_many :stores

	def to_s
		"#{name}"
	end

end