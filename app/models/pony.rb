class Pony < ApplicationRecord
  belongs_to :user
  has_many :pony_offers

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true

  has_attachment :photo
end
