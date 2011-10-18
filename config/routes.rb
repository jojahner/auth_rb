Auth::Application.routes.draw do  
  root to: 'home#index'

  # Authentication  
  get    '/users/sign_in',  to: 'sessions#new',     as: 'new_session'
  post   '/users/sign_in',  to: 'sessions#create',  as: 'session'
  delete '/users/sign_out', to: 'sessions#destroy', as: 'destroy_session'

  resources :users, only: [:index, :show]
  
  # Oauth2 provider routes
  match '/auth/authorize'
  match '/auth/access_token'
  match '/auth/user'


end
