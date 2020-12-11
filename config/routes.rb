Rails.application.routes.draw do

  get 'rides/create'

  resources :users, only: [:new, :show]
  post '/users/new', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  post '/logout', to: 'sessions#destroy'

  resources :attractions

  post '/rides/create', to: 'rides#create'

  root 'statics#home'

end