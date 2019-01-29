class Homeowner < ActiveRecord::Base
	has_secure_password
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, uniqueness: true
	
	has_many :trees
end
