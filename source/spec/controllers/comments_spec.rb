require 'rails_helper'
describe CommentsController do
  it "responds successfully with an HTTP 200 status for showing a users' comments" do
    user = User.create(email: "hi@gmial.com", about_me: "hiiiiii")
    comment = Comment.create(content: "hiiiii")
    user.comments << comment
    get :index, user_id: user.id
    expect(response).to be_success
  end
end