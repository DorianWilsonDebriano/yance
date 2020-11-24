class Trainer < ApplicationRecord
  belongs_to :user
  has_many :sports_classes

  searchkick
end
