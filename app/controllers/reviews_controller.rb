class ReviewsController < ApplicationController
    def create
        byebug
        
    end
    # def create
        
    #     comment = Comment.find_or_create_by(user_id: params[:user_id], mars_card_id: params[:mars_card_id],comment: params[:comment])
    #     render json: { mars_card_id: comment.mars_card, comment: comment.comment,id: comment.id} 

    # end

    # def destroy
        
    #     comment =Comment.find(params[:id])
    #     comment.destroy
    
    # end
end
