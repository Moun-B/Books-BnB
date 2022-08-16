class Offer < ApplicationRecord
  has_many :rentals
  belongs_to :book
  belongs_to :user
end
