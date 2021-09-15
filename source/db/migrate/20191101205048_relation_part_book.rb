class RelationPartBook < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :book_id, :integer
  end
end
