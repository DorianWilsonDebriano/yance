class RemovePriceFromMemberships < ActiveRecord::Migration[6.0]
  def change
    remove_column :memberships, :price, :float
  end
end
