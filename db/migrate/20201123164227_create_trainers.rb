class CreateTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.text :bio
      t.string :sport_category
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
