module PlayersHelper
	def player_create (num_per_team, team_id, league_id)
		num_per_team.times do |t|
			Player.create(name: 'Player ' + "#{t + 1}", team_id: team_id, league_id: league_id)
		end
	end

	def score_find (player, week, game)
		scores = player.scores.reverse
		scores.sort_by! { | score | score.game_id }

		games = player.league.games_per_match
		score_length = week * games
		score = score_length - (games - game) - 1
		if score >= scores.length
			'TBD'
		else
			scores[score].score
		end
	end
end
