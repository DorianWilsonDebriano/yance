class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trainers, dependent: :destroy
  has_many :sports_classes, through: :trainers

  has_many :class_bookings, dependent: :destroy
  has_many :reviews

  has_one :subscription
  has_one :membership, through: :subscription

  has_one_attached :photo

  def all_booked_classes
    class_bookings.map { |booking| booking.sports_class }
  end
end
