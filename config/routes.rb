Rails.application.routes.draw do
  root "static_pages#home"
  get 'users/new'
  get 'users/create'
  get 'users/show'
  root "static_pages#home"
  resources :users, only: [:new, :create, :show]
  resources :attractions
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/session', to: 'session#destroy'
  post '/rides', to: 'rides#create'
end
