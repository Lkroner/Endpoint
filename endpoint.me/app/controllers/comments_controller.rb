class CommentsController < ApplicationController
  #GET /reviews/:review_id/comments
  #GET /users/:user_id/comments
  def index
    if params[:review_id]
      review = Review.find(:review_id)
      comments = review.comments   
      render json: {comments: comments}.to_json
    elsif params[:user_id]
      user = User.find(params[:user_id])
      comments = user.comments 
      render json: {comments: comments}.to_json
    else
      render json: {errors: comments.errors}
    end
  end


  # POST  /reviews/:review_id/comments
  def create
    #assuming params come in in proper format
    comment = Comment.new(params[:comment])
    if comment.save
      review = Review.find(params[:review_id])
      review.comments << comment
    else
      render json: {errors: comment.errors}
    end
  end

end

