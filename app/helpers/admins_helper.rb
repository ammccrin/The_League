module AdminsHelper

	def current_admin
	  @admin ||= Admin.find_by(id: session[:admin_id])
	end

	def require_admin
	  redirect_to '/' unless current_admin
	end

	#used for if then statements!
	def admin_login?
	  !!current_admin
	end

	def authorized_admin(league_id)
	  redirect_to '/' unless  (current_admin.leagues[0].id == league_id)
	end


end
