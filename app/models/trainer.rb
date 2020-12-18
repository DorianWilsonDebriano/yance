class Trainer < ApplicationRecord
  after_create :send_welcome_trainer_email
  belongs_to :user
  has_many :sports_classes, dependent: :destroy
  has_many :reviews
  has_one_attached :profile_photo
  has_one_attached :time_line_photo
  validates :city, presence: true
  validates :bio, presence: true
  validates :sport_category, presence: true

  private

  def send_welcome_trainer_email
    TrainerMailer.with(trainer: self).welcome_trainer.deliver_now
  end
end
