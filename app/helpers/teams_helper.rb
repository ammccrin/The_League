module TeamsHelper
	def team_create(num, id)
		num = num.to_i
		num.times do |n|
			Team.create(name: 'Team ' + "#{n + 1}", league_id: id)
		end
	end

	# def num_of_players_check (input)
	# 	# if input 
	# end
end
