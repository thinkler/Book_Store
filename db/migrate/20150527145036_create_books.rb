class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :title
      t.float   :price
      t.integer :count
      t.integer :year
      t.string  :isnb
      t.text    :about
      t.timestamps null: false
    end
  end
end
