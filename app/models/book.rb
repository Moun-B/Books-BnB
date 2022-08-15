class Book < ApplicationRecord
  has_many :offers
  has_many :rentals, through: :offers
  has_many :users, through: :offers
  has_many :reviews, dependent: :destroy

  CATEGORIES = ["Romance", "Sci-Fi", "Thriller", "Classic"]
end
