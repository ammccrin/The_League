class Admin < ApplicationRecord
	has_many :leagues
	has_secure_password


	validates :username, presence: true
end
