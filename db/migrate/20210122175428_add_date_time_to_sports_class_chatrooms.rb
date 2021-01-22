class AddDateTimeToSportsClassChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :sports_class_chatrooms, :date_time, :datetime
  end
end
