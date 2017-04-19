class Match < ApplicationRecord
	has_many :scores
	has_many :games
	belongs_to :league
	belongs_to :week
	belongs_to :team1, class_name: 'Team', foreign_key: 'team1_id'
	belongs_to :team2, class_name: 'Team', foreign_key: 'team2_id'


	validates :team1_id, :team2_id, :league_id, presence: true 

end
