class Trainer < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_photo
  has_one_attached :time_line_photo
end
