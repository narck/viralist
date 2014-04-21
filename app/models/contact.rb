class Contact < ActiveRecord::Base
	belongs_to :company
	belongs_to :store
	validates :phone, length: { in: 10..10 }
	


	def to_s
		"#{fname} #{lname}"
	end

end
