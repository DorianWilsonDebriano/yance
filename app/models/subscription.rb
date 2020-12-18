class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :membership
  validates_uniqueness_of :user_id
end
