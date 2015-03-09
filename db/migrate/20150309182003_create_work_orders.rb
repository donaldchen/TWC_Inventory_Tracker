class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.string :item
      t.integer :quantity
      t.string :code
    end
  end
end
