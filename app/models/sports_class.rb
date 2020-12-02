class SportsClass < ApplicationRecord
  belongs_to :trainer
  has_one(:user, through: :trainer)
  has_one_attached :photo
  has_many :class_bookings
  has_many :users, through: :class_bookings


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

  # searchkick word_start: %i[title trainer]

  # def search_data
  #   {
  #     title: title,
  #     description: description,
  #     trainer_first: trainer.user.first_name,
  #     trainer_last: trainer.user.last_name,
  #     duration: duration,
  #     experience_level: experience_level,
  #     category: category
  #   }
  # end

  include PgSearch::Model
  pg_search_scope :search,
    against: [:category, :title, :description],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def self.categories
    categories = []

    SportsClass.all.each do |sports_class|
      categories << sports_class.category unless categories.include?(sports_class.category)
    end
    categories.sort
  end

  def self.difficulty_level
    difficulty = []

    SportsClass.all.each do |sports_class|
      difficulty << sports_class.difficulty_level unless difficulty.include?(sports_class.difficulty_level)
    end
    difficulty.sort
  end

  def self.experience_level
    experience = []

    SportsClass.all.each do |sports_class|
      experience << sports_class.experience_level unless experience.include?(sports_class.experience_level)
    end
    experience.sort
  end

  def self.sweat_level
    sweat = []

    SportsClass.all.each do |sports_class|
      sweat << sports_class.sweat_level unless sweat.include?(sports_class.sweat_level)
    end
    sweat.sort
  end

  def self.durations
    durations = []

    SportsClass.all.each do |sports_class|
      durations << sports_class.duration unless durations.include?(sports_class.duration)
    end
    durations.sort
  end
end

