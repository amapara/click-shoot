class SaleItem < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  validates :model, presence: true
  validates :set_up_rate, presence: true
  validates :daily_rate, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :city, presence: true
end
