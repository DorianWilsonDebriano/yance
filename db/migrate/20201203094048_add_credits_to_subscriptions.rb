class AddCreditsToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :credits, :integer
  end
end
