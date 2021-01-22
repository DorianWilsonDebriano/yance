class CreateSportsClassChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :sports_class_chatrooms do |t|
      t.string :name
      t.references :sports_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
