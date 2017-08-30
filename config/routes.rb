Rails.application.routes.draw do
  devise_for :users
	root 'homes#show'
	resources :users 
	resources :posts
end
