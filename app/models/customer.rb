class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bikes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_bikes, through: :likes, source: :bike
  
  has_many :reviews, dependent: :destroy
  has_many :reviewed_bikes, through: :reviews, source: :bike
  
  def already_liked?(bike)
    self.likes.exists?(bike_id: bike.id)
  end
  
  def already_reviewed?(bike)
    self.reviews.exists?(bike_id: bike.id)
  end
end
