module UsersHelper

	def current_user
	  @user ||= User.find_by(id: session[:user_id])
	end

	def require_user
	  redirect_to '/' unless current_user
	end

	#used for if then statements!
	def user_login?
	  !!current_user
	end

	def authorized_user(league_id)
	  redirect_to '/' unless  (current_user.league.id == league_id)
	end

end
