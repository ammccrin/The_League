module MatchesHelper
	def match_done (match)
		games = match.league.games_per_match
		week =  match.league.weeks.last
		score_length = week.week * games

		matchup_done = true

		match.team1.players.each do |player|
			if player.scores.length < score_length
				matchup_done = false
			end
		end

		match.team2.players.each do |player|
			if player.scores.length < score_length
				matchup_done = false
			end
		end
		# returning true / false based on if all player scores have been added
		matchup_done
	end

	def score_calculator (match)
		array = [
							top_wins(match),
							top_score(match),
							top_match(match),
							top_series(match)
						]

		array = array.transpose
		array[0] = array[0].inject { | sum, num | sum + num }
		array[1] = array[1].inject { | sum, num | sum + num }

		week = match.week

		team1 = match.team1.points.find_or_initialize_by(week_id: week.id)
		team1.update_attributes(points: array[0])

		team2 = match.team2.points.find_or_initialize_by(week_id: week.id)
		team2.update_attributes(points: array[1])
		array

	end

	def top_wins (match)
		games = match.league.games_per_match

		points = [0, 0]

		games.times do |i|
		team1_score = 0
		team2_score = 0

			match.team1.players.each do |p|
				scores = p.scores.sort_by { | score | score.id  }
				scores = scores.last(games)
				team1_score += scores[i].score
			end

			match.team2.players.each do |p|
				scores = p.scores.sort_by { | score | score.id  }
				scores = scores.last(games)
				team2_score += scores[i].score
			end


			if team1_score > team2_score
				binding.pry
				points[0] += 3
				points[1] += 0
			else
				points[1] += 3
				points[0] += 0
			end
		end

		points

	end

	def top_score (match)
		games = match.league.games_per_match
		team1_scores = []
		team2_scores = []
		points = [0, 0]

			match.team1.players.each do |p|
				scores = p.scores.sort_by { | score | score.id  }.reverse!
				games.times do |i|
					team1_scores << scores[i].score
				end
			end
			team1_scores.sort!

			match.team2.players.each do |p|
				scores = p.scores.sort_by { | score | score.id  }.reverse!
				games.times do |i|
					team2_scores << scores[i].score
				end
			end
			team2_scores.sort!

<<<<<<< HEAD
=======
			

>>>>>>> 87b313d952598fdc13691e662845978be173b82d
			if team1_scores[-1] > team2_scores[-1]
				points[0] += 1
				points[1] += 0
			else
				points[1] += 1
				points[0] += 0
			end
			points
	end

	def top_match (match)
		games = match.league.games_per_match

		team1_scores = []
		team2_scores = []
		points = [0, 0]

		games.times do |i|
			score = 0

			match.team1.players.each do |p|
				scores = p.scores.sort_by { | score | score.id  }.reverse!
				score += scores[i].score
			end
				team1_scores << score
				team1_scores.sort!
				score = 0

			match.team2.players.each do |p|
				scores = p.scores.sort_by { | score | score.id  }.reverse!
				score += scores[i].score
			end
				team2_scores << score
				team1_scores.sort!
		end 

		if team1_scores[-1] > team2_scores[-1]
				points[0] += 1
				points[1] += 0
			else
				points[1] += 1
				points[0] += 0
			end
		points

	end


	def top_series (match)
		games = match.league.games_per_match

		team1_scores = 0
		team2_scores = 0
		points = [0, 0]

		games.times do |i|
			score = 0

			match.team1.players.each do |p|
				scores = p.scores.sort_by { | score | score.id  }.reverse!
				score += scores[i].score
			end
				team1_scores += score
				score = 0

			match.team2.players.each do |p|
				scores = p.scores.sort_by { | score | score.id  }.reverse!
				score += scores[i].score
			end
				team2_scores += score
		end 

		if team1_scores > team2_scores
				points[0] += 1
				points[1] += 0
			else
				points[1] += 1
				points[0] += 0
			end
		points

	end

	# def matches_done (matches)
	# 	#loop through all matches, check it they are done.
	# 	#If they are, then..
	# 	# Create a new week in the league
	# 	#Calculate players averages
	# 	# Calcualte matchup scores
	# 	# Show previous matches
	# 	if matchup_done(match)
	# 	end
	# end


end