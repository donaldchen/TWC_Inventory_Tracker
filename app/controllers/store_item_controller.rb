class StoreItemController < ApplicationController
	include Databasedotcom::Rails::Controller
	def index

	end

	def store
		item_code = params[:item][:ItemCode]
		quantity = params[:item][:Quantity]
		if not Item__c.find_by_Code__c(item_code)
			flash[:notice] = "Invalid Item Code"
		elsif not quantity =~ /^[0-9]+$/
			flash[:notice] = "quantity must be numeric"
		end

		if not flash[:notice]
			item = Item__c.find_by_Code__c(item_code)
			orig = item.Quantity__c.to_i
			item_name = item.Name.pluralize
			item_name = item_name.slice(0,1).capitalize + item_name.slice(1..-1)
			item.Quantity__c = (orig + quantity.to_i).to_s
			item.save
			flash[:notice] = "#{quantity} #{item_name} Added"
		end
		redirect_to store_item_path
	end

end