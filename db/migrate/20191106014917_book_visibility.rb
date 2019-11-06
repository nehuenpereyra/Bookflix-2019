class BookVisibility < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :visibility, :boolean
  end
end
