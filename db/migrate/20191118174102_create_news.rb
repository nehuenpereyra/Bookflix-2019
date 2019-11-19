class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :content
      t.date :publication_date

      t.timestamps
    end
  end
end
