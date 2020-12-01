class AddDescriptionToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :description, :text
  end
end
