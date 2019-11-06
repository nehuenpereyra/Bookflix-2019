class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :card_key
      t.integer :card_number
      t.date :expiration_date

      t.timestamps
    end
  end
end
