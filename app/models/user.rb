class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rentals
  has_many :offers, dependent: :destroy
  has_many :books, through: :offers
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
end
