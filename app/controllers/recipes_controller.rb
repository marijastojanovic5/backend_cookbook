class RecipesController < ApplicationController

    def index
        recipe =Recipe.all
        render json: recipe.to_json(
            {:except => [:created_at, :updated_at], :include =>[:ingredients,:reviews,:users]})
    end
    def show
        recipe = Recipe.find(params[:id])
        render json: recipe.to_json(
            {:except => [:created_at, :updated_at], :include =>[:reviews,:users]})
               

    end
    # need to add user and ingredients to the create method for a new recipe
  def create
    
    recipe = Recipe.create(title: params[:title], cook_time: params[:cookTime], instructions: params[:instructions], picture: params[:picture], gluten_free: params[:gluten], vegetarian: params[:vegetarian], dairy_free: params[:dairy], vegan: params[:vegan])
    render json: { recipe: recipe}
  end
    def favorite
        favorite_rec= Favorite.find_or_create_by(user_id: params[:user_id], recipe_id: params[:recipe_id])
        render json: favorite_rec.recipe
    end
    def destroy
       
        user_id=params[:user_id]
        recipe_id=params[:recipe_id]
        favors=Favorite.find_by(:user_id=>user_id, :recipe_id=>recipe_id)      
        favors.destroy 
       
    end

    
end
