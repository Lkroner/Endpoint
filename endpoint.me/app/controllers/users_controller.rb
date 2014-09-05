class UsersController < ApplicationController
  # POST '/users'
  def create
    new_user = User.new(params[:user])
    if new_user.save 
      render json: {user: new_user}.to_json
    else
      render json: {errors: new_user.errors}
    end
  end

  # GET '/users/:id'
  def show
    user = User.find(params[:id])
    if user
      render json: {user: user}.to_json
    else
      render status: :unprocessable_entity, json: { message: "#{params[:id]} is not a valid api id!" }.to_json
    end
  end


  # PUT '/users/:id'
  def update
    user = User.find(params[:id])
      if user.update_attributes(params[:user])
        render json: {user: user}.to_json
      else
        render status: :unprocessable_entity, json: {errors: user.errors}.to_json
      end
  end


  def login
  end

  def login_user
  end

  def logout
  end

  def github_callback
  end
end