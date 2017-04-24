module LeaguesHelper
	def order_players(league)
		league.players.sort_by { |player| player.average }
	end

	def weekly_matches_create(league, curr_week)
		teams = league.teams.to_a
		week = curr_week.week % ((teams.length) -1) -1

		if week == -1
			week = 0
		end
		
		teams_top = [teams[0]]
		teams.delete_at(0)
		teams = teams.to_a.rotate(week)
		teams_top = teams_top + teams[0...(teams.length / 2)]
		teams_bottom = teams[(teams.length / 2)..-1].reverse

		teams_top.each_with_index do |team, i|
			match = Match.create(team1_id: team.id, team2_id: teams_bottom[i].id, league_id: league.id, week_id: curr_week.id )

			league.games_per_match.times do | i |
				match.games.create(game_num: i+1 )
			end
		end

	end

	def weekly_matches_done (matches)
		matches_done = true

		matches.each do | match |
			if match_done(match)
			else
				matches_done = false
			end
		end
		matches_done

	end
	
end
