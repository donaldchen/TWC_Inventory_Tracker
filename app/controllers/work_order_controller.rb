class WorkOrderController < ApplicationController
	def index
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
		redirect_to item_list_path
	end

	def item_list

	end

	def confirmation

	end

	private 
		def work_order_params
    		params.require(:code).permit(:item, :quantity)
    	end
end
