class CreateSportsClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :sports_classes do |t|
      t.string :title
      t.text :description
      t.datetime :date_time
      t.string :duration
      t.string :category
      t.integer :difficulty_level
      t.integer :sweat_level
      t.string :experience_level
      t.boolean :equipment, default: false
      t.string :language
      t.references :trainer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
