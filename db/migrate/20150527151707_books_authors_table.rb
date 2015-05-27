class BooksAuthorsTable < ActiveRecord::Migration
  def change
    create_table :books_authors, id: false do |t|
      t.belongs_to :book, index: true
      t.belongs_to :author, index: true
    end
  end
end
