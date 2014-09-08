class UsersController < ApplicationController
  # POST '/users'
  def create
    puts "paramssss #{params}"
    @user = User.new(email: params[:email])
    @user.password = params[:password]
    if @user.save
      puts "i'm saving"
      render json: {user: @user}.to_json
    else
      puts "i'm not saving"
      render json: {errors: @user.errors}
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
    user = User.find_by_email(params[:email])
    if user.password == params[:password]
      render json: {authenticate: true}.to_json
    else
      render json: {authenticate: false}.to_json
    end
  end

  def login_user
  end

  def logout
  end

  def github_callback
  end
end