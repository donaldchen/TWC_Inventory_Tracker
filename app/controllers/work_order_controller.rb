class WorkOrderController < ApplicationController
    include Databasedotcom::Rails::Controller

	def index
	end

	def check
		work_order_code = params[:work_order][:WorkOrderCode]

		if not work_order_code =~ /^[0-9]+$/
			flash[:notice] = "Not a numeric work order"
			redirect_to work_order_home_path
		elsif Care_Package__c.find_by_id__c(work_order_code) == nil
		 	flash[:notice] = "Invalid work order code"
		 	redirect_to work_order_home_path
		else
			redirect_to item_list_path(work_order_code)
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
			# add functionality
			
			redirect_to item_list_path
		end
	end

	def item_list
		@entry = Care_Package__c.find_by_id__c(params[:id])
		@list_details = Program_Detail__c.find_all_by_Care_Package__c(@entry.Id)
	end

	def destroy
  		@item = Program_Detail__c.find(params[:id])
  		@item.delete
  		redirect_to item_list_path
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
