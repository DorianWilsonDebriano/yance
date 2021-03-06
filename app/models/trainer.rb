class Trainer < ApplicationRecord
  after_create :send_welcome_trainer_email

  #associations
  belongs_to :user
  has_many :sports_classes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :profile_photo, dependent: :destroy
  has_one_attached :time_line_photo, dependent: :destroy
  has_many :invoices, dependent: :destroy

  #validations
  validates :city, presence: true
  validates :bio, presence: true
  validates :sport_category, presence: true

  private

  def send_welcome_trainer_email
    TrainerMailer.with(trainer: self).welcome_trainer.deliver_now
  end
end
