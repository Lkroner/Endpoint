require 'rails_helper'

describe ReviewsController do
  it "responds successfully with an HTTP 200 status for showing a users' reviews" do
    user = User.create(email: "hi@gmial.com", about_me: "hiiiiii")
    review = Review.create(title: "This API is almost as bad at PW's API", content: "hiiiii")
    user.reviews << review
    get :index, user_id: user.id
    expect(response).to be_success
  end

  it "successfully updates a review" do
    review = Review.create(score: 4, content: "hiiiiii", title: "i'm a person")
    expect {
      review.update_attributes(content: "not hiiiiii")
    }.to change {review.content}
  end
end