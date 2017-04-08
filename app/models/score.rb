class Score < ApplicationRecord
	belongs_to :player
	belongs_to :game

	validates :score, presence: true, numericality: { greater_than: 0, less_than: 301 }
	validates :player_id, :game_id, presence: true 
end
