class AddDefaultValueToCarts < ActiveRecord::Migration
  def change
    change_column :carts, :status, :string, :default => "In progress"
  end
end
