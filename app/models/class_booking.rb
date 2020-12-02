class ClassBooking < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :sports_class, touch: true

  validates_uniqueness_of :user_id, :scope => [:sports_class_id]
end

