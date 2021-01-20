class User < ApplicationRecord
  # after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :trainers, dependent: :destroy
  has_many :sports_classes, through: :trainers
  has_many :class_bookings, dependent: :destroy
  has_many :messages
  has_many :reviews, dependent: :destroy
  has_one :subscription, dependent: :destroy
  has_one :membership, through: :subscription
  has_one_attached :photo

  def all_booked_classes
    SportsClass.find(class_bookings.pluck(:sports_class_id))
  end

  private

  def after_confirmation
    UserMailer.with(user: self).welcome_user.deliver_now
  end
end
