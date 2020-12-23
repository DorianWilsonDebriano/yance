class ChangeDurationToBeIntegerInSportsClasses < ActiveRecord::Migration[6.0]
  def change
    change_column :sports_classes, :duration, :integer, using: 'duration::integer'
  end
end
