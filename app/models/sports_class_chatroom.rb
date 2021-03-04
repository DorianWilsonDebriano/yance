class SportsClassChatroom < ApplicationRecord
  belongs_to :sports_class
  has_many :sports_class_messages, dependent: :destroy
end
