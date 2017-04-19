class AdminsController < ApplicationController

	def new
		@admin = Admin.new
		if request.xhr?
			render 'admins/_admin_form', layout: false
		else
			render 'admins/new'
		end
	end

	def login
		@admin = Admin.find_by(username: admin_params[:username])

		if request.xhr?
				if @admin && @admin.authenticate(admin_params[:password]) 
				  session[:user_id] = nil
					session[:admin_id] = @admin.id
					@league = @admin.leagues[0]
					redirect_to league_path(@league)
				else
				 errors = ['Userame and Password do not match']
 				 @user = User.new
 				 @admin = Admin.new
				 render 'layouts/_errors', status: :unprocessable_entity, layout: false, locals: { errors: errors }        
				end
			else
				if @admin && @admin.authenticate(admin_params[:password]) 
				  session[:user_id] = nil
					session[:admin_id] = @admin.id
					@league = @admin.leagues[0]

					render "leagues/show"
				else
					errors = ['Username and Password do not match']
					@user = User.new
 				  @admin = Admin.new
			    render 'users/new', locals: { errors: errors }
				end
			end
	end

	def create
		@admin = Admin.new(admin_params)
		@league = League.new

			if request.xhr?
				if @admin.save
				  session[:user_id] = nil
					session[:admin_id] = @admin.id
					render 'leagues/_league_form', layout: false
				else
				 errors = @admin.errors.full_messages
				 render 'layouts/_errors', status: :unprocessable_entity, layout: false, locals: { errors: errors }        
				end
			else
				if @admin.save
				  session[:user_id] = nil
					session[:admin_id] = @admin.id
					render 'leagues/new'
				else

					errors = @admin.errors.full_messages
			    render 'admins/new', locals: { errors: errors }
				end
			end
				
	end


	private

  def admin_params
    params.require(:admin).permit(:username, :password)
  end
end
