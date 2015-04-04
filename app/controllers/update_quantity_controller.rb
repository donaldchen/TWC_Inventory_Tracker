class UpdateQuantityController < ApplicationController
	def index
		@items = Inventory.all
	end

	def update_item
		@item = Inventory.where(code: params[:id]).first
		flash[:code] = @item.code
	end

	def update
		correct_quantity = params[:item][:quantity]
		code = params[:item][:ItemCode]
		if not correct_quantity.to_s =~ /^[0-9]+$/
			flash[:notice] = "Quantity must be a number"
			redirect_to update_item_path(flash[:code])
		else
			@item = Inventory.where(code: flash[:code]).first
			@item.quantity = correct_quantity
			@item.save
			redirect_to update_quantity_path
		end
	end
end