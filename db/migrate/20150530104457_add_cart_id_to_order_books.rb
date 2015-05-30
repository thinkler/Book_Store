class AddCartIdToOrderBooks < ActiveRecord::Migration
  def change
    add_column :order_books, :cart_id, :integer
  end
end
