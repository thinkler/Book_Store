class AddShortAboutToBooks < ActiveRecord::Migration
  def change
    add_column :books, :short_about, :text
  end
end
