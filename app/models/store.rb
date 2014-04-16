class Store < ActiveRecord::Base
	has_many :visits
	has_many :contacts
	belongs_to :company


	def to_s
		"#{company.name} #{name}"
	end
end
