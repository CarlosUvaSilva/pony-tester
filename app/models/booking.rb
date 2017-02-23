class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pony_offer

  validates :user_id, presence: true
  validates :pony_offer_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true

  def duration
    (self.end_date - self.start_date).to_i + 1
  end

  def dates
    current_date = self.start_date
    result_array = []
    while current_date <= self.end_date
      result_array << current_date
      current_date += 1
    end
    result_array
  end
end
