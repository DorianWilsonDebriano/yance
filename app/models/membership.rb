class Membership < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  monetize :price_cents
end
