class Offer < ApplicationRecord

  has_many :rentals, dependent: :destroy
  belongs_to :book
  belongs_to :user
  accepts_nested_attributes_for :book

  validates :price, presence: true
  validates :book, presence: true, uniqueness: { scope: :user }
  validates :user, presence: true

  # search
  include PgSearch::Model
  pg_search_scope :search,
    against: [:price],
    associated_against: {
      book: [ :title, :author ]
    },
    using: {
      tsearch: {
        prefix: true
      }
    }

  enum :condition, [:like_new, :very_good, :good, :acceptable]
end
