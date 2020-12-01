class AddRoomToSportsClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :sports_classes, :room, :string
  end
end
