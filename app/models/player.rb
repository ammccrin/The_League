class Player < ApplicationRecord
	belongs_to :team
	belongs_to :league
	has_many :scores

	validates :name, :team_id, :league_id, presence: true

	def calculate_average
		scores = self.scores.map { | score | score.score }
		total = scores.inject { | sum, score |  sum + score }
		average = total / scores.length
		self.update_attributes(average: average)
	end


end
