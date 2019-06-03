class Booking < ApplicationRecord
  #Should distinguish User b/ween buyer & seller?
  belongs_to :user
  belongs_to :sale_item

  validates :sale_item_id, uniqueness: true, presence: true
  validates :dates_booked, presence: true # format: { with:  }
  validates :total_price, presence: true
  validates :pickup_location, presence: true
  validates :drop_off_location, presence: true
  validates :user_id, uniqueness: true, presence: true
end
