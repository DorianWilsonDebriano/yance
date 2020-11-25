class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trainers, dependent: :destroy

  has_many :class_bookings, dependent: :destroy

  has_one_attached :photo

end
