class Trainer < ApplicationRecord
  belongs_to :user
  has_many :sports_classes, dependent: :destroy

  has_many :reviews


  has_one_attached :profile_photo
  has_one_attached :time_line_photo

  validates :profile_photo, presence: true
  validates :city, presence: true
  validates :bio, presence: true
  validates :sport_category, presence: true

  # searchkick
end
