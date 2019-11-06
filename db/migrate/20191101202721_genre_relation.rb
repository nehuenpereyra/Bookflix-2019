class GenreRelation < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :book_id, :integer
  end
end
