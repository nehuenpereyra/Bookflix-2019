class TrailerRelation < ActiveRecord::Migration[6.0]
  def change
    add_column :trailers, :book_id, :integer
    add_column :trailers, :url_document, :string
  end
end
