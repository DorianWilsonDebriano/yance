class ClassBooking < ApplicationRecord
  belongs_to :user
  belongs_to :sports_class
  validates_uniqueness_of :user_id, scope: [:sports_class_id]
end
