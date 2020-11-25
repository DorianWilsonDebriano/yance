class Trainer < ApplicationRecord
  belongs_to :user
  has_many :sports_classes
  has_many :reviews, through: :sports_classes
  has_one_attached :profile_photo
  has_one_attached :time_line_photo
end
