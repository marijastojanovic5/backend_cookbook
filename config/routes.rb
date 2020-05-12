Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  post '/login', to: "users#login"
  resources :recipes
  post '/favoriterecipe', to: "recipes#favorite"
  resources :ingredients 
  resources :favorites




end
