class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sale_item
end
