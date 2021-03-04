class SportsClass < ApplicationRecord
  CATEGORIES = ["Yoga", "Pilates", "Cardio", "Strength", "Stretching", "Barre", "Meditation", "Dance", "Full body", "Back", "Legs", "Arms", "Abs", "HIIT", "Crossfit", "Body Building", "Aerobics", "Martial Arts"]
  LANGUAGES = ["English", "German", "French", "Spanish"]
  belongs_to :trainer
  has_one :sports_class_chatroom, dependent: :destroy
  has_one(:user, through: :trainer)
  has_one_attached :photo
  has_many :class_bookings, dependent: :destroy
  has_many :users, through: :class_bookings

  validates :title, presence: true, length: {
    maximum: 40,
    too_long: "%{count} characters is the maximum allowed"
  }
  validates :description, presence: true
  validates :date_time, presence: true
  validates :duration, presence: true
  validates :category, presence: true, length: {
    maximum: 15,
    too_long: "%{count} characters is the maximum allowed"
  }
  validates :difficulty_level, presence: true
  validates :sweat_level, presence: true
  validates :experience_level, presence: true
  validates :language, presence: true
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search,
    against: %i[category title description],
    associated_against: {
      user: %i[first_name last_name]
    },
    using: {
      tsearch: { prefix: true }
    }

  def self.languages
    SportsClass.pluck(:language).uniq.sort
  end

  def self.categories
    SportsClass.pluck(:category).uniq.sort
  end

  def self.difficulty_level
    SportsClass.pluck(:difficulty_level).uniq.sort
  end

  def self.experience_level
    SportsClass.pluck(:experience_level).uniq.sort
  end

  def self.sweat_level
    SportsClass.pluck(:sweat_level).uniq.sort
  end

  def self.durations
    SportsClass.pluck(:duration).uniq.sort
  end
end
