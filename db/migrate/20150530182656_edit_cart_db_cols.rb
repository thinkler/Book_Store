class EditCartDbCols < ActiveRecord::Migration
  def change
    remove_column :carts, :book_id, :integer
    add_column :carts, :phone, :integer
    add_column :carts, :adress, :string
    add_column :carts, :name, :string
  end
end
