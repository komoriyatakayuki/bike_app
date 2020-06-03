class Review < ApplicationRecord
  belongs_to :bike
  belongs_to :customer
  validates_uniqueness_of :bike_id, scope: :customer_id
  validates :rate, numericality: {
  less_than_or_equal_to: 5,
  greater_than_or_equal_to: 1
  }, presence: true
end
