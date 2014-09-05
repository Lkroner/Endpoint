class VotesController < ApplicationController
  # GET /reviews/:review_id/votes(.:format)
  def index
    votes = Review.find(params[:review_id]).votes
    render json: {votes: votes}
  end

  # POST /reviews/:review_id/votes(.:format)
  def create
    new_vote = Review.find(params[:review_id]).votes.new(params[:vote])
    if new_vote.save
      render json: {vote: new_vote}.to_json
    else
      render json: {errors: vote.errors}.to_json
    end
  end
end
