class LeaguesController < ApplicationController
	def index
	end

	def new
		@league = League.new
	end

	def create
		@admin = current_admin
		@league = League.new(league_params)
		@league.admin_id = @admin.id


		if request.xhr?
				if @league.valid? && (params[:league][:teams]).to_i.even?
					@league.save
					User.create(name: league_params[:name], password: league_params[:password], league_id: @league.id)
					team_create(params[:league][:teams], @league.id)
					@week = Week.create(league_id: @league.id, week: 1)
					weekly_matches_create(@league, @week)
					render 'teams/_team_form', layout: false
				else
					if !(params[:league][:teams]).to_i.even?
						errors = @league.errors.full_messages
						errors << 'Has to be an even number of teams'
					else
					 errors = @league.errors.full_messages
					end
				 render 'layouts/_errors', status: :unprocessable_entity, layout: false, locals: { errors: errors }        
				end
			else
				if @league.valid?
						@league.save

					session[:league_id] = @league.id
					render 'teams/new'
				else

					@errors = @league.errors.full_messages
			    render 'teams/new', locals: { errors: @errors }
				end
			end
	end

	def show
		if current_admin
			authorized_admin(params[:id].to_i)
			@admin = current_admin
			@league = @admin.leagues[0]

		elsif current_user
			authorized_user(params[:id].to_i)
			@user = current_user
			@league = @user.league

		else
			redirect_to '/'
		end

		if current_user || current_admin
			@week = @league.weeks[-1]
			@teams = @league.order_teams_points
			@players = order_players(@league)
			@matches = @week.order_matches
			if @week.matches == []
				weekly_matches_create(@league, @week)
			end

			if weekly_matches_done(@matches) 
				@matches.each do | match |
					score_calculator(match)
				end

				if @league.num_of_weeks != @week.week
					@week = @league.weeks.create(week: @league.weeks.length + 1)
					weekly_matches_create(@league, @week)
					@matches = @week.matches

					@players.each do | player |
						player.calculate_average
					end

					@players = order_players(@league)
				end
			end
		end
	end

	private

  def league_params
    params.require(:league).permit(:name, :games_per_match, :password, :num_of_weeks, :playoffs)
  end
end
