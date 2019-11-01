class CreateTrailers < ActiveRecord::Migration[6.0]
  def change
    create_table :trailers do |t|
      t.date :normal_release_date
      t.date :premium_release_date

      t.timestamps
    end
  end
end
