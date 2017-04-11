class Team < ApplicationRecord
	belongs_to :league
	has_many :players
	has_many :points

	validates :name, :league, presence: true

	def count_points
		points = self.points
		points = points.map { | p | p.points }
		
		if points == []
			total = 0
			total
		else 
			total = points.inject { | sum, p | sum + p }
			total
		end
	end

end
