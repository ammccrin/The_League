class Week < ApplicationRecord
	belongs_to :league
	has_many :matches
	has_many :scores


	def order_matches
		matches = self.matches.sort_by { | match | match.id }
		matches
	end
end
