class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # The owned_ponies method returns the Ponies owned by the current user.
  has_many :owned_ponies, class_name: "Pony", dependent: :destroy
  # Defines the method owned_pony_offers for displaying the current offers of the user
  # As it redefines the method name we have to specify the class_name of the object returned by the method
  # It will look for the association through the owned_ponies of the user in the association named pony_offers
  # defined in the Pony class.
  has_many :owned_pony_offers, class_name: "PonyOffer", through: :owned_ponies, source: :pony_offers

  has_many :bookings, dependent: :destroy
  has_many :booked_pony_offers, class_name: "PonyOffer", through: :bookings, source: :pony_offer

end
