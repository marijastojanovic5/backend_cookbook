class IngredientsController < ApplicationController
    def index
        ingredient =Ingredient.all
        render json: ingredient.to_json(
            {:except => [:created_at, :updated_at] })
    end
end
