class Contact < ActiveRecord::Base
	belongs_to :company
	belongs_to :store

	def to_s
		"#{fname} #{lname}"
	end

end
