class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :text
      t.boolean :spoiler
      t.integer :book_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
