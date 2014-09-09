require 'rails_helper'
describe ApisController do
		before :each do
    	Api.destroy_all
 		end
    it "successfully creates a new api" do
      expect {
        post :create, title: "hi", description: "hi", tips: "hi"
      }.to change { Api.count }
    end
    it "responds successfully with an HTTP 200 status code for showing an api" do
    	api = Api.create(title: "hi", description: "hi", tips: "hi")
      get :show, id: api.id
      expect(response).to be_success
    end
    it "successfully updates an api" do
    	api = Api.create(title: "hi", description: "hi", tips: "hi")
    	expect {
    		api.update_attributes(title: 'meep')
    	}.to change {api.title}
    end
end