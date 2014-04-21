class Store < ActiveRecord::Base
	has_many :visits
	belongs_to :contact
	has_many :contacts
	belongs_to :company

	validates_uniqueness_of :name, :scope => :company_id


	def last_visited
		latest = visits.where(store_id: id).order(:visitdate).reverse_order.first
		if latest.nil?
			return -1
		else
			return latest.days_since
		end
	end

	def latest_visitor
	
	end

	def threshold_exceeded
		return last_visited > threshold
	end

	def to_s
		"#{company.name} #{name}"
	end
end
