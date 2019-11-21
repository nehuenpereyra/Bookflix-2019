class SubscriberRemoveFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscribers, :current_profiles, :integer
    remove_column :subscribers, :remium_membership, :boolean
  end
end
