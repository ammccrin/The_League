class AdminsController < ApplicationController

	def new
		@admin = Admin.new
		if request.xhr?
			render 'admins/_admin_form', layout: false
		else
			render 'admins/new'
		end
	end

	def create
		@admin = Admin.new(admin_params)
		@league = League.new

			if request.xhr?
				if @admin.save
					session[:admin_id] = @admin.id
					render 'leagues/_league_form', layout: false
				else
				 errors = @admin.errors.full_messages
				 render 'layouts/_errors', status: :unprocessable_entity, layout: false, locals: { errors: errors }        
				end
			else
				if @admin.save
					session[:admin_id] = @admin.id
					render 'leagues/new'
				else

					@errors = @admin.errors.full_messages
			    render 'leagues/new', locals: { errors: @errors }
				end
			end
				
	end


	private

  def admin_params
    params.require(:admin).permit(:username, :password)
  end
end
