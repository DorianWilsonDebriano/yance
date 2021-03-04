class CreateSportsClassMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :sports_class_messages do |t|
      t.string :content
      t.references :sports_class_chatroom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
