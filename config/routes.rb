Rails.application.routes.draw do
	root "leagues#index"

	resources :leagues
	resources :admins
	resources :teams
	resources :players
	resources :scores

end
