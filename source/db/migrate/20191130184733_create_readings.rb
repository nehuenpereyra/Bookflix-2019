class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.string :state
      t.integer :part_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
