class WorkOrderController < ApplicationController
	def index
	end

    def item_list
       @items = ["Hello", "Diapers", "Items"]
    end
	def check
		work_order_code = params[:work_order][:WorkOrderCode]

		if not work_order_code =~ /^[0-9]+$/
			flash[:notice] = "Invalid order number"
			redirect_to work_order_home_path
			#elsif WorkOrder.where(code: work_order_code).first
		else
			redirect_to item_list_path
		end
	end

	def add_to_work_order
		

	end

	def add_item_confirm
		item_code = params[:item][:ItemCode]
		quantity = params[:item][:Quantity]
		if not Inventory.where(code: item_code).first
			flash[:notice] = "invalid item code"
		elsif not quantity =~ /^[0-9]+$/
			flash[:notice] = "quantity must be numeric"
		elsif Integer(quantity) > Inventory.where(code: item_code).first.quantity
			flash[:notice] = "not enough items in inventory"
		end

		if flash[:notice]
			redirect_to add_item_path
		else
			redirect_to item_list_path
		end
	end

	def item_list

	end

	def confirmation

	end

	private 
		def work_order_params
    		params.require(:code).permit(:item, :quantity)
    	end

    	def inventory_params
    		params.permit(:item, :code, :quantity)
    	end
end