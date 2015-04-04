require 'spec_helper'
require 'rails_helper'

RSpec.describe WorkOrderController, type: :controller do
	describe "POST #update" do
		it "succesfully redirects" do
			post :update, {:id => 987, :item => {:pid => "a02o000000BjijN", :newvalue => 5.0}}, {}
			response.should redirect_to item_list_path
		end
	end
		
end
