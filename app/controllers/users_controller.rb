class UsersController < ApplicationController
    def index
        user=User.all
        render json: user.map{ |user| {user: user, favorites: user.recipes}}
        
    end
    def show
        user = User.find(params[:id])
        render json: {user: user, favorites: user.recipe}

    end

    def create
        
        user =User.find_or_create_by(first_name: params[:firstName],last_name: params[:lastName],username: params[:username],password: params[:password])
        render json: {user: user}
    end
    
end
