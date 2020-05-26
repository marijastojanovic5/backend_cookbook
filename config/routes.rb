Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  post '/login', to: "users#login"
  resources :reviews
  delete '/recipes/:recipe_id',to: 'reviews#destroy'
  post '/recipes/:recipe_id',to:   'reviews#create'
  resources :recipes
  post '/favoriterecipe', to: "recipes#favorite"
  delete '/favoriterecipe/:user_id/:recipe_id', to: 'recipes#destroy'
  resources :ingredients 
  resources :favorites




end
