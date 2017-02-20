class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pony_offer

  validates :user_id, presence: true
  validates :pony_offer_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
end
