class Contact < ActiveRecord::Base
	belongs_to :company
	belongs_to :store
	validates :fname, presence: true
	validates :lname, presence: true
	validates :phone, length: { in: 7..10 }
	validates :email, format: { with: /\A\S+@.+\.\S+\z/, message: "doesn't seem to be a valid address" }

	

	def to_s
		"#{fname} #{lname}"
	end

end