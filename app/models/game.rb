class Game < ApplicationRecord
	belongs_to :match
	has_many :scores

	validates :match, :game_num, presence: true
end
