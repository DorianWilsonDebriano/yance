class ClassBooking < ApplicationRecord
  belongs_to :user
  belongs_to :sports_class
end
