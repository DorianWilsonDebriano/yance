class SportsClass < ApplicationRecord
  belongs_to :trainer
  has_one_attached :photo
  has_many :class_bookings

  validates :title, presence: true,length: { maximum: 40,
    too_long: "%{count} characters is the maximum allowed" }
  validates :description, presence: true
  validates :date_time, presence: true
  validates :duration, presence: true
  validates :category, presence: true, length: { maximum: 30,
    too_long: "%{count} characters is the maximum allowed" }
  validates :difficulty_level, presence: true
  validates :sweat_level, presence: true
  validates :experience_level, presence: true
  validates :language, presence: true
  validates :photo, presence: true

  searchkick word_start: %i[title trainer]

  def search_data
    {
      title: title,
      description: description,
      trainer_first: trainer.user.first_name,
      trainer_last: trainer.user.last_name,
      duration: duration,
      experience_level: experience_level,
      category: category
    }
  end
end
