class User < ActiveRecord::Base

  validates :username, uniqueness: true, length: { in: 3..15 }
  validates :realname, uniqueness: true, length: { in: 3..20 }
  validates :password, length: { minimum: 3 }, format: { with: /.*(\d.*[A-Z]|[A-Z].*\d).*/,
  												message: "should contain a uppercase letter and a number" }
  has_many :visits


	has_secure_password

	def to_s
		"#{realname}"
	end	
end
