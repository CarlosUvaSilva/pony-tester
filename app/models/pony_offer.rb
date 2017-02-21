class PonyOffer < ApplicationRecord
  belongs_to :pony
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
end
