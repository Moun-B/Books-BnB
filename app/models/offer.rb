class Offer < ApplicationRecord
  has_many :rentals, dependent: :destroy
  belongs_to :book
  belongs_to :user
  accepts_nested_attributes_for :book

  validates :price, presence: true
end
