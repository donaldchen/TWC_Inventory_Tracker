class UpdateQuantityController < ApplicationController
	def index
		@items = Inventory.all
	end

	def update_item
		@item = Inventory.where(code: params[:id]).first
		flash[:code] = @item.code
	end

	def update
		correct_quantity = params[:item][:quantity].to_i
		@item = Inventory.where(code: flash[:code]).first
		p @item.class
		@item.quantity = correct_quantity
		p @item
		@item.save
		redirect_to update_quantity_path
	end

end