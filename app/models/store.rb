class Store < ActiveRecord::Base
	has_many :visits
	has_many :contacts
	belongs_to :company


	def last_visited
		visits.where(store_id: id).order(:visitdate).reverse_order.first.days_since
	end


	def to_s
		"#{company.name} #{name}"
	end
end
