class Rental < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :duration_start, presence: true
  validate :duration_start_cannot_be_in_the_past, on: :create
  validate :not_overlapping
  validate :not_same_user
  validates :duration_end, presence: true
  validate :duration_end_cannot_be_in_the_past, on: :create

  enum :status, [:pending, :accepted, :rejected], default: :pending

  def duration_start_cannot_be_in_the_past
    if duration_start.present? && duration_start < Date.today
      errors.add(:duration_start, "Can't be in the past")
    end
  end

  def duration_end_cannot_be_in_the_past
    if duration_end.present? && duration_end < Date.today
      errors.add(:duration_end, "Can't be in the past")
    end
  end

  def not_overlapping
    existing_rentals = offer.rentals.where("duration_start <= ? AND duration_end >= ?", duration_end, duration_start)
    if existing_rentals.any?
      errors.add(:base, "Already booked for this days")
    end
  end

  def not_same_user
    if rental.user == rental.offer.user
      errors.add(:user, "User can't be offerer")
    end
  end

  def price
    offer.price * (duration_end - duration_start).to_i
  end

  def days
    (duration_end - duration_start).to_i
  end
end
