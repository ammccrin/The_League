class Team < ApplicationRecord
	belongs_to :league
	has_many :players
	has_many :points

	validates :name, :league, presence: true

	def count_points
		points = self.points
		points = points.map { | p | p.points }
		total = points.inject { | sum, p | sum + p }
		if total == nil
			total = 0
		else 
			total
		end
	end

end
