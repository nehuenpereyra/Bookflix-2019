class RelacionLibrosEtiquetas < ActiveRecord::Migration[6.0]
  def change
    create_table :books_tags, id: false do |t|
      t.belongs_to :book
      t.belongs_to :tag
    end
  end
end
