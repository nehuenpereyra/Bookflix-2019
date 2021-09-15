class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :url_image
      t.boolean :age_restriction

      t.timestamps
    end
  end
end
