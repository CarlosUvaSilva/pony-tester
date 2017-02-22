class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def home
    @pony_offers = PonyOffer.where(most_recent: true).reverse.take(6);
  end

  # Search method to be implemented
  def search
    @pony_offers = PonyOffer.where(most_recent: true).take(6);
    render :home
  end
end
