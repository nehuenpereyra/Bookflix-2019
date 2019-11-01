class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.integer :position
      t.date :normal_release_date
      t.date :premium_release_date

      t.timestamps
    end
  end
end
