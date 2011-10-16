Auth::Application.routes.draw do  
  root to: 'home#index'
  
  devise_for :users  
  resources :users, only: [:index, :show]
  
  # Oauth2 provider routes
  match '/auth/authorize'
  match '/auth/access_token'
  match '/auth/user'


end
