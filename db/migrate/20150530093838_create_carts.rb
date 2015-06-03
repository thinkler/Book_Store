class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :status
      t.float :total_price

      t.references :book, index: true
      t.references :order_books, index: true

      t.timestamps null: false
    end
  end
end
