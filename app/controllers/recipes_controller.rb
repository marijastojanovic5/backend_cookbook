class RecipesController < ApplicationController

    def index
        recipe =Recipe.all
        render json: recipe.to_json(
            {:except => [:created_at, :updated_at]}
        )
    end
    def

    
end
