Rails.application.routes.draw do
  root "welcome#index"
  resources :users
  get "/signin", to: "sessions#new", as: '/signin'
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
