class BookChanges < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :autor, :string
    add_column :books, :url_cover, :string
    add_column :books, :editorial, :string
  end
end
