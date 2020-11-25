class SportsClass < ApplicationRecord
  belongs_to :trainer, dependent: :destroy
  has_one_attached :photo
  has_many :class_bookings
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :date_time, presence: true
  validates :duration, presence: true
  validates :category, presence: true
  validates :difficulty_level, presence: true
  validates :sweat_level, presence: true
  validates :experience_level, presence: true
  validates :language, presence: true
  validates :photo, presence: true
end
