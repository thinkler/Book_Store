class CreateOrderBooks < ActiveRecord::Migration
  def change
    create_table :order_books do |t|
      t.float :unit_price
      t.float :sum_price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
