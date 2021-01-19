class AddPasswordToSportsClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :sports_classes, :password, :string
  end
end
