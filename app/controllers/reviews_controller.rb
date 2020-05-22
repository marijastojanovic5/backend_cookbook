class ReviewsController < ApplicationController
    def create
       
        review = Review.find_or_create_by(user_id: params[:user_id], recipe_id: params[:recipe_id], rating: params[:rating],review: params[:reviewText])
        render json: { recipe_id: review.recipe.id, review: review.review, id: review.id, rating: review.rating}
    end
    

    # def destroy
    #     review =Review.find(params[:id])
    #     review.destroy
    
    # end
end
