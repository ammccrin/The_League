class ScoresController < ApplicationController
	def create
		@team = Team.find_by(id: params[:team_id])
		@week = @team.league.weeks.last
		@match = Match.find_by(id: params[:match])
		@game = Game.find_by(id: params[:game_id])
		scores = []

		@team.players.each_with_index do | player, i |
			# Check to see if player is absent
			if params["p#{i}".to_s].downcase != 'a'
				score = Score.find_or_initialize_by(player_id: player.id, game_id: params[:game_id], week_id: @week.id)
				score.update_attributes(score: params["p#{i}".to_s])
				scores << score
			end
		end

		if match_done(@match)
			@match.update_attributes(result: score_calculator(@match))
		end
		# Check to see if all scores can be saved
		saved = check_save(scores)

		if request.xhr?
				if saved
					render "leagues/_#{params[:team]}_score_form", layout: false, locals: { match: @match, game: @game }
				else
				 errors = ['Please enter a # from 0 - 300']
				 render 'layouts/_errors', status: :unprocessable_entity, layout: false, locals: { errors: errors }        
				end
		# else
				# if saved
				# 	render 'teams/new'
				# else
				# 	errors = ['Please enter a # from 0 - 300']
			 #    render 'teams/new', locals: { errors: errors }
				# end
		end
	end
end
