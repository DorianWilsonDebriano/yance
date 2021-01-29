class AddSubscriptionStatusToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :subscription_status, :string, default: 'incomplete'
  end
end
