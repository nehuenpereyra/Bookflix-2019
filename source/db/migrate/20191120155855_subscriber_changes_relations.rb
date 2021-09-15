class SubscriberChangesRelations < ActiveRecord::Migration[6.0]
  def change
    add_column :subscribers, :current_profiles, :integer
    add_column :subscribers, :premium_membership, :boolean
    add_column :profiles, :subscriber_id, :integer
  end
end
