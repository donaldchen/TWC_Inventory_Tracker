class WorkOrderController < ApplicationController
	def index
		#redirect_to itemlist_path
	end

	def check
		redirect_to itemlist_path
	end

	def add_to_work_order

	end

	def add_item_confirm
		redirect_to itemlist_path
	end
end