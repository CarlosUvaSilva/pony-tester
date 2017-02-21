class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]


  # The owned_ponies method returns the Ponies owned by the current user.
  has_many :owned_ponies, class_name: "Pony", dependent: :destroy
  # Defines the method owned_pony_offers for displaying the current offers of the user
  # As it redefines the method name we have to specify the class_name of the object returned by the method
  # It will look for the association through the owned_ponies of the user in the association named pony_offers
  # defined in the Pony class.
  has_many :owned_pony_offers, class_name: "PonyOffer", through: :owned_ponies, source: :pony_offers

  has_many :bookings, dependent: :destroy
  has_many :booked_pony_offers, class_name: "PonyOffer", through: :bookings, source: :pony_offer

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

end
