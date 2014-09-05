class SearchController < ApplicationController
  # get '/'
  def index
  end

  # get '/search'
  def search
  	api = Api.find_by_title(params[:input])
  	if api
  		render json: {api: api}.to_json
  	else
  		render status: :unprocessable_entity, json: { errors: api.errors }.to_json
  	end
  end

end