require 'spec_helper'
require 'rails_helper'

RSpec.describe UpdateQuantityController, type: :controller do
=begin
	describe "GET #update" do
		before(:each) do
			Inventory.create(item: "Diapers", code: 000, quantity: 7)
		end
		it "succesfully flashes when quantity not a number" do
			get :update, {item: {:ItemCode => 000, :Quantity => "Hi"}}, {}
			expect(flash[:notice]).to eq "Quantity must be a number"
		end
	end
=end
end
