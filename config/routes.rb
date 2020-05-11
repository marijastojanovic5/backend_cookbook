Rails.application.routes.draw do
  resources :users
  resources :recipes
  post '/favoriterecipe', to: "recipes#favorite"
  resources :ingredients 
  resources :favorites




end
