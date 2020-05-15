Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  post '/login', to: "users#login"
  resources :recipes
  post '/favoriterecipe', to: "recipes#favorite"
  delete '/favoriterecipe/:user_id/:recipe_id', to: 'recipes#destroy'
  resources :ingredients 
  resources :favorites




end
