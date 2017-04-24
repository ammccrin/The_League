class TeamsController < ApplicationController

	def new
		@teams = current_admin.leagues[0].order_teams
		@num_of_players = params[:num_of_players].to_i

		@teams.each do |team|
			league = team.league
			player_create(@num_of_players, team.id, league.id)
		end
	end

	def create
		@teams = current_admin.leagues[0].order_teams
		@league = current_admin.leagues[0]
		@num_of_players = params[:num_of_players].to_i

		@teams.each do |team|
			league = team.league
			player_create(@num_of_players, team.id, league.id)
		end

		if request.xhr?
				if @num_of_players > 0 && @num_of_players < 7
					render 'players/_player_form', layout: false
				else
				 errors = ['Choose a number 1-7']
				 render 'layouts/_errors', status: :unprocessable_entity, layout: false, locals: { errors: errors }        
				end
			else
				if @num_of_players > 0 && @num_of_players < 7
					render 'players/new'
				else
				 	errors = ['Choose a number 1-7']
			    render 'players/new', locals: { errors: errors }
				end
			end
	end
end
