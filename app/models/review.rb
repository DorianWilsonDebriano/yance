class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sports_class
  belongs_to :trainer
end
