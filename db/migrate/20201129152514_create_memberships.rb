class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.string :title
      t.date :expiration_date
      t.integer :credits
      t.float :price

      t.timestamps
    end
  end
end
