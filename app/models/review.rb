class Review < ApplicationRecord
  belongs_to :bike
  belongs_to :customer
  validates_uniqueness_of :bike_id, scope: :customer_id
end
