class PonyOffer < ApplicationRecord
  belongs_to :pony
  has_one :user, through: :pony
  has_many :bookings

  validates :pony_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :daily_rate, presence: true

  before_create :mark_most_recent

  # Once we create a new pony_offer for a certain pony, it will mark its previous most recent offer as most_recent=false
  # Doing so, we will be able to track the active offers for a certain pony, there can indeed be only one active offer per
  # pony
  def mark_most_recent
    unless self.pony.pony_offers.empty?
      previous_recent_offer = self.pony.pony_offers.order(:created_at => :asc).last
      previous_recent_offer.most_recent = false
      previous_recent_offer.save
    end
  end

  def unavailable_dates
    result_array = []
    if self.bookings.empty?
      return []
    else
      self.bookings.each do |booking|
        booking.dates.each do |date|
          result_array << date.strftime('%-m-%-d-%Y')
        end
      end
    end
    result_array.unshift((Date.today - 1).strftime('%-m-%-d-%Y'))
  end

  def check_availability(booking)
    dates = booking.dates
    dates.each do |date|
      return true if self.unavailable_dates.include?(date.strftime('%-m-%-d-%Y'))
    end
    start = booking.start_date
    finish = booking.end_date
    if self.start_date > start || self.end_date < finish
      return true
    end
    false
  end
end
