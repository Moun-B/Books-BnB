class Rental < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :duration_start, presence: true
  validate :duration_start_cannot_be_in_the_past, on: :create

  validates :duration_end, presence: true
  validates :price, presence: true

  enum :status, [:pending, :accepted, :rejected], default: :pending

  def duration_start_cannot_be_in_the_past
    if duration_start.present? && duration_start < Date.today
      errors.add(:duration_start, "Can't be in the past")
    end
  end
end
