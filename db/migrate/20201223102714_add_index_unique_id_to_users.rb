class AddIndexUniqueIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :stripe_customer_id, unique: true
  end
end
