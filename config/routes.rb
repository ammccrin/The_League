Rails.application.routes.draw do
	root "leagues#index"

	resources :leagues
	resources :admins
		post '/admins/login', to: 'admins#login'
	resources :users
	resources :teams
	resources :players
	resources :scores

end
