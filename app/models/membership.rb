class Membership < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions
  monetize :price_cents
end
