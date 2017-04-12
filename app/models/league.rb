class League < ApplicationRecord
	belongs_to :admin
	has_many :teams
	has_many :players
	has_many :weeks
	has_many :matches
	# has_many :games
	# has_many :scores
	# has_many :matches

	validates :name, presence: true, uniqueness: true
	validates :admin_id, :games_per_match, presence: true
	validates :password, presence: true
	validates :games_per_match, numericality: { greater_than: 0, less_than: 5 }
	validates :num_of_weeks, presence: true, numericality: { greater_than: 2 }
	validates :playoffs, presence: true, numericality: { greater_than_or_equal: 1 }


	def next_week
		if self.curr_week < self.weeks
			self.curr_week += 1
		end
	end


	def order_teams
		order = self.teams.sort_by { | team | team.count_points }
		order = order.reverse
	end

end
