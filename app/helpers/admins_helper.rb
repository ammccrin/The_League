module AdminsHelper

	def current_admin
	  @admin ||= Admin.find_by(id: session[:admin_id])
	end

	def require_admin
	  redirect '/' unless current_admin
	end

	#used for if then statements!
	def admin_login?
	  !!current_admin
	end

	def authorized_admin(object_owner)
	  redirect '/' unless  (current_admin == object_owner)
	end


end
