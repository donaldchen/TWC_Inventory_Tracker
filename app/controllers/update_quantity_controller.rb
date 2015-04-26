class UpdateQuantityController < ApplicationController
	include Databasedotcom::Rails::Controller
	def index
		@items = Item__c.all
        if (params[:order] == "name")
            @items.sort! { |a,b| a.Name <=> b.Name }
        elsif (params[:order] == "quantity")
            @items.sort! { |a,b| a.Quantity__c.to_i <=> b.Quantity__c.to_i}
        end
	end

	def update_item
		@item = Item__c.find_by_Code__c(params[:id])
	end

	def update
		correct_quantity = params[:item][:Quantity__c]
		code = params[:item][:id]

		if not correct_quantity.to_s =~ /^[0-9]+$/
			flash[:notice] = "Quantity must be a number"
			redirect_to update_item_path(code)
		else
			@item = Item__c.find_by_Code__c(code)
			@item.Quantity__c = correct_quantity
			@item.save
			redirect_to update_quantity_path
		end
	end
end