class Store < ActiveRecord::Base
	has_many :visits
	has_many :contacts
	belongs_to :company
end
