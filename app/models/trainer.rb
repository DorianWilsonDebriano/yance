class Trainer < ApplicationRecord
  belongs_to :user
  has_many :sports_classes, dependent: :destroy

  has_many :reviews


  has_one_attached :profile_photo
  has_one_attached :time_line_photo

  searchkick
end
