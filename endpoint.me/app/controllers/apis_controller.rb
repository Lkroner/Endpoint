class ApisController < ApplicationController
  def create
    #expecting params to be complete and not nested
    @new_api = Api.new(params)
    respond_to do |format|
      if new_api.save
        format.json {render json: @new_api}
      else
        #need to add error messages, or are we skipping these?
        puts "did not save succesfully"
        #format.json {render json: @new_api.errors type of error}
    end
  end 

  def show
    @api = Api.find(params[:api_id])    
    respond_to do |format|
      format.json { render json: @show}
    end
  end

  def update
    @api = Api.find(params[:api_id])
    respond_to do |format|
      if @api.update_attributes(params[:user])
        format.json { head :no_content, status: :ok }
      else
        puts "did not update properly"
        # format properly with proper erro message
        #format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

end

