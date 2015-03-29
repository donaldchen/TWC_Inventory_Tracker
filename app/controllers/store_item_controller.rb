class StoreItemController < ApplicationController
	def index

	end

	def store
		item_code = params[:item][:ItemCode]
		quantity = params[:item][:Quantity]
		if not Inventory.where(code: item_code).first
			flash[:notice] = "Invalid Item Code"
		elsif not quantity =~ /^[0-9]+$/
			flash[:notice] = "quantity must be numeric"
		end

		if not flash[:notice]
			item_name = Inventory.where(code: item_code).first.item.pluralize
			item_name = item_name.slice(0,1).capitalize + item_name.slice(1..-1)
			flash[:notice] = "#{quantity} #{item_name} Added"
		end
		redirect_to store_item_path
	end

end