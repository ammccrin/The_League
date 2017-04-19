class UsersController < ApplicationController
	def new
		@admin = Admin.new
		@user = User.new
		if request.xhr?
			render 'users/_user_form', layout: false
		else
			render 'users/new'
		end
	end

	def create
		#verifying user!
		@user = User.find_by(user_params)

			if request.xhr?
				if @user 
				  session[:admin_id] = nil
					session[:user_id] = @user.id
					@league = @user.league
					redirect_to league_path(@league)
				else
				 errors = ['Name and Password do not match']
				 render 'layouts/_errors', status: :unprocessable_entity, layout: false, locals: { errors: errors }        
				end
			else
				if @user
				  session[:admin_id] = nil
					session[:user_id] = @user.id
					@league = @user.league
					render "leagues/show"
				else
					@errors = ['Name and Password do not match']
			    render 'users/new', locals: { errors: @errors }
				end
			end
				
	end


	private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
