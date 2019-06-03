class SaleItem < ApplicationRecord
  belongs_to :user

  validates :model, presence: true
  validates :availability, presence: true
  validates :daily_rate, presence: true
  validates :setup_rate, presence: true
  validates :user_id, presence: true
end
