class SaleItem < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :model, presence: true
  validates :city, presence: true
end
