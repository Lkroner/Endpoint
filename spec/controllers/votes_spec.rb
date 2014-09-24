require 'rails_helper'
describe VotesController do
  it "responds with a successful status" do
    review = Review.create(score: 2.5, content:"I had a mediocre experience", title:"it was OK", api_id: 1)
    vote = Vote.create(user_id: 1, review_id: 1)
    review.votes << vote
    get :index, review_id: review.id
    expect(response).to be_success
  end

  it "accurately saves a new vote" do
    user = User.create(email: "hi@gmial.com", username: "meep", about_me: "hiiiiii")
    review = Review.create(score: 2.5, content:"I had a mediocre experience", title:"it was OK", api_id: 1)
    vote = Vote.create(user_id: user.id, review_id: 1)
    expect {
      post :create, review_id: review.id, user_id: user.id
      }.to change{review.votes.count}
  end
end