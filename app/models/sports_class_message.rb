class SportsClassMessage < ApplicationRecord
  belongs_to :sports_class_chatroom
  belongs_to :user
end
