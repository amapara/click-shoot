class SaleItem < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  validates :model, presence: true
  validates :city, presence: true
end
