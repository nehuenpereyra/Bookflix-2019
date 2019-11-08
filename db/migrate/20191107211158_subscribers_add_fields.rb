class SubscribersAddFields < ActiveRecord::Migration[6.0]
  def change
    add_column :subscribers, :card_number, :integer
    add_column :subscribers, :expiration_date, :date
    add_column :subscribers, :card_key, :integer

  end
end
