class RecipesController < ApplicationController

    def index
        recipe =Recipe.all
        render json: recipe.to_json(
            {:except => [:created_at, :updated_at]}
        )
    end
    def show
        recipe = Recipe.find(params[:id])
        render json:  recipe.to_json(
            {:except => [:created_at, :updated_at]}
        )
    end

    
end
