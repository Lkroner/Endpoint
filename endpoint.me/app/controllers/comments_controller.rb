class CommentsController < ApplicationController
  def index
    #/apis/:api_id/reviews/:review_id/comments(.:format)
    @api = Api.find(params[:api_id])
    @review = Review.find(params[:review_id])
    @ comments = @review.comments
    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  def create
    #assuming params come in in proper format
    @comment = Comment.new(params)
    if @comment.save

  end
end

@comment = Comment.new(content: params[:comment][:content],
                           user_id: session[:user_id],
                           commentable_id: commentable_id,
                           commentable_type: commentable_type)
    if @comment.save
      user = User.find(session[:user_id])
      user.comments << @comment
      if @comment.commentable_type == "Question"
        question = Question.find(params[:question_id])
        question.comments << @comment
        redirect_to question_path(question.id)
      elsif @comment.commentable_type == "Answer"
        answer = Answer.find(params[:answer_id])
        answer.comments << @comment
        redirect_to question_path(answer.question.id)
      end
    else
# def index
#     @users = User.all
#     respond_to do |format|
#       format.json { render json: @users }
#       format.xml { render xml: @users }
#     end
#   end

#   def create
#     @user = User.new(params[:user])
#     @user.temp_password = Devise.friendly_token
#     respond_to do |format|
#       if @user.save
#         format.json { render json: @user, status: :created }
#         format.xml { render xml: @user, status: :created }
#       else
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#         format.xml { render xml: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end