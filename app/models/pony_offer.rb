class PonyOffer < ApplicationRecord
  belongs_to :pony
  has_many :bookings

  validates :pony_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
