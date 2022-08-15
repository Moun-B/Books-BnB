class Book < ApplicationRecord
  has_many :rentals
  has_many :users, through: :rentals
  has_many :reviews, dependent: :destroy

  CATEGORIES = ["Romance", "Sci-Fi", "Thriller", "Classic"]
end
