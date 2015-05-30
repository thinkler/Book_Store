class AddBookIdToOrderBooks < ActiveRecord::Migration
  def change
    add_column :order_books, :book_id, :integer
  end
end
