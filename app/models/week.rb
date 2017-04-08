class Week < ApplicationRecord
	belongs_to :league
	has_many :matches
	has_many :scores
end
