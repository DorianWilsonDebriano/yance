class SportsClass < ApplicationRecord
  belongs_to :trainer
  has_many :reviews
end
