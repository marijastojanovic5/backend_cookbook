class RecipesController < ApplicationController

    def index
        recipe =Recipe.all
        render json: recipe.to_json(
            {:except => [:created_at, :updated_at], :include =>:ingredients})
    end
    def show
        recipe = Recipe.find(params[:id])
        render json:  recipe.to_json(
            {:except => [:created_at, :updated_at]}
        )
    end
    def favorite
        favorite_rec= Favorite.find_or_create_by(user_id: params[:user_id], recipe_id: params[:recipe_id])
        render json: favorite_rec.recipe
    end

    
end
