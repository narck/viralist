class Company < ActiveRecord::Base
	
	belongs_to :contact
	has_many :stores
	has_many :contacts, through: :stores

end