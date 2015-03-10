class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item
      t.string :code
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
