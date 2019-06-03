class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sale_items
  has_many :bookings
  validates :username, uniqueness: true, presence: true
  #change password format
  validates :password, presence: true, format: { with: /\A.*@.*\.com\z/ }
end
