class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sports_class
  has_one :trainer, through: :sports_class
end
