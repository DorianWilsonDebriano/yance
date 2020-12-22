class SportsClass < ApplicationRecord
  after_create :send_new_class_confirmation_email
  CATEGORIES = ["yoga", "pilates", "cardio", "strength", "stretching", "barre", "meditation", "dance", "full body", "back", "legs", "arms", "abs", "HIIT", "crossfit", "body building", "aerobics", "martial arts"]
  belongs_to :trainer
  has_one(:user, through: :trainer)
  has_one_attached :photo
  has_many :class_bookings
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

  private

  def send_new_class_confirmation_email
    SportsClassMailer.with(sports_class: self, trainer: trainer).new_class_confirmation.deliver_now
  end
end
