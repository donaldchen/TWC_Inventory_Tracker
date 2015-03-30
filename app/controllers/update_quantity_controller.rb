class UpdateQuantityController < ApplicationController
	def index
		@items = Inventory.all
	end

end