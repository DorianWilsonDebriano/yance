class SportsClassMessage < ApplicationRecord
  belongs_to :sports_class_chatroom
  belongs_to :user
  # add a read_at date_time column to messages
  # scope :unread, -> { where(read_at: nil) }
end
