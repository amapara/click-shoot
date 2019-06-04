class Booking < ApplicationRecord
  belongs_to :user_id
  belongs_to :sale_item
end
