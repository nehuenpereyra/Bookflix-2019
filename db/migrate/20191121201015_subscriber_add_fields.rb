class SubscriberAddFields < ActiveRecord::Migration[6.0]
  def change
    add_column :subscribers, :membership_premium, :boolean
    add_column :subscribers, :current_profiles, :integer
    add_column :subscribers, :expiration_month_date, :integer
    add_column :subscribers, :expiration_year_date, :integer
  end
end
