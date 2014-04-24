class Store < ActiveRecord::Base
	has_many :visits, dependent: :destroy
	belongs_to :contact
	belongs_to :company
	has_many :contacts
	

	validates_uniqueness_of :name, :scope => :company_id, message: "already exists within company!"
	validates :name, :city, :address, :zip, presence: true
	validates :zip, :numericality => {:only_integer => true}, length: { in: 00000..99999 } #only finnish zips

	geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates


	def last_visited
		latest = visits.where(store_id: id).order(:visitdate).reverse_order.first
		if latest.nil?
			return -1
		else
			return latest.days_since
		end
	end

	def threshold_exceeded
		return last_visited > threshold
	end

	def nearing_threshold
		return last_visited > threshold / 2
	end

	def to_s
		"#{company.name} #{name}"
	end

	def full_street_address
		"#{address}, #{zip} #{city}"
	end
end
