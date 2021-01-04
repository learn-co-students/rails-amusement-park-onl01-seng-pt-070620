Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/users/new' => 'users#new'
  post '/logout' => 'sessions#destroy'
  root 'welcome#home'
  post '/take_ride' => 'users#ride'
end
