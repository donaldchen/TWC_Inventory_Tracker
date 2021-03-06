class WorkOrderController < ApplicationController
    include Databasedotcom::Rails::Controller

	def index
	end

	def check
		work_order_code = params[:work_order][:id__c]

		if not work_order_code =~ /^[0-9]+$/
			flash[:notice] = "Not a numeric work order"
			redirect_to work_order_home_path
		elsif Care_Package__c.find_by_id__c(work_order_code) == nil
		 	flash[:notice] = "Invalid work order code"
		 	redirect_to work_order_home_path
		elsif Care_Package__c.find_by_id__c(work_order_code).Status__c == "Closed"
			flash[:notice] = "Care Package has closed"
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

		if Item__c.find_by_Code__c(item_code) == nil
			flash[:notice] = "invalid item code"
			redirect_to add_item_path(params[:id])
		elsif not quantity =~ /^[0-9]+$/
			flash[:notice] = "quantity must be numeric"
			redirect_to add_item_path(params[:id])
		# inventory = Inventory.where(code: item_code).first.quantity
		# elsif quantity.to_i > inventory.to_i
		# 	flash[:notice] = "not enough items in inventory"
		# 	redirect_to add_item_path(params[:id])
		else
			# add functionality
			program_detail = Program_Detail__c.new
			program_detail.Care_Package__c = Care_Package__c.find_by_id__c(params[:id]).Id
			program_detail.Name = item_code
			program_detail.Quantity__c = quantity
			program_detail.Program_Item__c = Item__c.find_by_Code__c(item_code).Name
			program_detail.save
			redirect_to item_list_path(params[:id])
		end
	end

	def item_list
		@entry = Care_Package__c.find_by_id__c(params[:id])
		@list_details = Program_Detail__c.find_all_by_Care_Package__c(@entry.Id)
	end

	def destroy
  		@item = Program_Detail__c.find(params[:pid])
  		@item.delete
  		redirect_to item_list_path(params[:id])
	end

	def update
		item_code = params[:item][:pid]
		quantity = params[:item][:newvalue]
		program_detail = Program_Detail__c.find(item_code)
		# inventory_count = Item__c.find_by_Code__c(program_detail.Name).Quantity__c
		
		program_detail.Quantity__c = quantity
		program_detail.save
		flash[:notice] = "Successfully Updated"

		# if inventory_count.to_i >= quantity.to_i
		# 	program_detail.Quantity__c = quantity
		# 	program_detail.save
		# 	flash[:notice] = "Successfully Updated"
		# else
		# 	flash[:notice] = "Update unsuccessful, not enough in inventory."
		# end
		redirect_to item_list_path(params[:id])
	end
	
	def confirmation
		@care_package = Care_Package__c.find_by_id__c(params[:id])
	end

	def deliver
		@entry = Care_Package__c.find_by_id__c(params[:id])
		@list_details = Program_Detail__c.find_all_by_Care_Package__c(@entry.Id)

		if @entry.Status__c == "Open"
			canTakeOut = true
			for elem in @list_details
				@currItem = Item__c.find_by_Code__c(elem.Name)
				numInventory = @currItem.Quantity__c.to_i
				if elem.Quantity__c > numInventory
					canTakeOut = false
					break
				end
			end
			if canTakeOut
				for elem in @list_details
					@currItem = Item__c.find_by_Code__c(elem.Name)
					numInventory = @currItem.Quantity__c.to_i
					@currItem.Quantity__c = ((numInventory - elem.Quantity__c).to_i).to_s
					@currItem.save
				end	
			else
				flash[:notice] = "Not enough items in inventory."
			end
		else
			flash[:notice] = "The Care Package is already closed"
		end
		p "*" * 80
		p flash[:notice]
		if flash[:notice]
			#redirect_to confirmation_path(@entry.id__c)
			redirect_to confirmation_path(params[:id])
			return nil
		else
			@entry.Status__c = "Closed"
			@entry.save
			flash[:notice] = "Delivery Confirmed"
			redirect_to work_order_home_path
			return nil
		end
	end

	def new
		rand_num = rand(100000).to_s
		id = Care_Package__c.find_by_id__c(rand_num)
	    while id != nil do
	      rand_num = rand(100000).to_s
	      id = Care_Package__c.find_by_id__c(rand_num)
	    end
	    id = rand_num
	    @care_package = Care_Package__c.create(:id__c => id, :Name => "individual item")
	    redirect_to item_list_path(id)
	end


	private 
		def work_order_params
    		params.require(:code).permit(:item, :quantity)
    	end

    	def inventory_params
    		params.permit(:item, :code, :quantity)
    	end
end
