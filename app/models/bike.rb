class Bike < ApplicationRecord
  belongs_to :customer
  has_many :likes, dependent: :destroy
  has_many :liked_customers, through: :likes, source: :customer
  
  has_many :reviews
  has_many :reviewed_customers, through: :reviews, source: :customer
end
