class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.boolean :ok
      t.integer :book_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
