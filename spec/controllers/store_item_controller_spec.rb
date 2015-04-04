require 'spec_helper'
require 'rails_helper'

RSpec.describe StoreItemController, type: :controller do
	describe "POST #store" do
		describe "No ItemCode 000" do
			it "succesfully redirects" do
				get :store, {item: {:ItemCode => 000, :Quantity => 5.0}}, {}
				response.should redirect_to store_item_path
			end

			it "succesfully flashes when ItemCode doesn't exists" do
				get :store, {item: {:ItemCode => 000, :Quantity => 5.0}}, {}
				expect(flash[:notice]).to eq "Invalid Item Code"
			end
		end
		describe "ItemCode 000 == Diapers" do
			before(:each) do
				Inventory.create(item: "Diapers", code: 000, quantity: 7)
			end

			it "succesfully flashes when quantity isn't a number" do
				get :store, {item: {:ItemCode => 000, :Quantity => "hi"}}, {}
				expect(flash[:notice]).to eq "quantity must be numeric"
			end

			it "succesfully flashes when everything is good" do
				get :store, {item: {:ItemCode => 000, :Quantity => 5}}, {}
				expect(flash[:notice]).to eq "5 Diapers Added"
			end

			it "succesfully flashes when everything is good" do
				a = Inventory.where(code: 000).first.quantity
				get :store, {item: {:ItemCode => 000, :Quantity => 5}}, {}
				b = Inventory.where(code: 000).first.quantity
				expect(b).to eq a+5
			end
		end
	end
end
