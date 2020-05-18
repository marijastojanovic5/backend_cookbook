class ReviewsController < ApplicationController
    def create
       
        review = Review.create(user_id: params[:user_id], recipe_id: params[:recipe_id], rating: params[:rating],review: params["reviewText"])
        render json: { recipe_id: review.recipe, review: review.review, id: review.id, rating: review.rating}
    end
    

    # def destroy
    #     comment =Comment.find(params[:id])
    #     comment.destroy
    
    # end
end
