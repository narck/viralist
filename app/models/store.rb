class Store < ActiveRecord::Base
	has_many :visits
	belongs_to :contact
	has_many :contacts
	belongs_to :company

	validates_uniqueness_of :name, :scope => :company_id, message: "already exists within company!"
	validates :name, :city, :address, :zip, presence: true
	validates :zip, :numericality => {:only_integer => true}, length: { in: 00000..99999 } #only finnish zips



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
