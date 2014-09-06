require 'rails_helper'
describe SearchController do
	describe "GET #index" do
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
	end
	describe "GET #search" do
	    it "responds successfully with an HTTP 200 status code for searching for an api" do
	      api = Api.create(title: "hi", description: "hi", tips: "hi")
	      get :search, input: "hi"
	      expect(response).to be_success
	    end
	end
end