class StoreItemController < ApplicationController
	def index

	end

	def store
		item_code = params[:item][:ItemCode]
		quantity = params[:item][:Quantity]
		if not Inventory.where(code: item_code).first
			flash[:notice] = "invalid item code"
		elsif not quantity =~ /^[0-9]+$/
			flash[:notice] = "quantity must be numeric"
		end

		if not flash[:notice]
			flash[:notice] = "#{quantity} #{Inventory.where(code: item_code).first.item.pluralize} added"
		end
		redirect_to store_item_path
	end

end