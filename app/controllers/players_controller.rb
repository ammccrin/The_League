class PlayersController < ApplicationController
	def new
		@teams = current_admin.leagues[0].order_teams
		@league = current_admin.leagues[0]

		@num_of_players = params[:num_of_players].to_i

		@teams.each do |team|
			league = team.league
			player_create(@num_of_players, team.id, league.id)
		end
	end

	def create
		@team = Team.find_by(id: params[:team_id])
		@team.update_attributes(name: params[:team_name])
		@league = current_admin.leagues[0]

		@team.order_players.each_with_index do |player, i|
			player.update_attributes(name: params[:"Player #{i + 1}"])
		end

		@teams = current_admin.leagues[0].order_teams
		@players = @team.order_players

		if request.xhr?
			render 'players/_player_form', layout: false
		else
			render 'players/new'
		end
	end

end
