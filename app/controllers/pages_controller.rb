class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def home
    @pony_offers = PonyOffer.where(most_recent: true).reverse.take(6);
  end

  # Search method to search for an offer in a specific city and date interval
  def search
    start = params[:start_date]
    finish = params[:end_date]
    @available_offers = []
    @booking = Booking.new(start_date: Date.parse(start), end_date: Date.parse(finish))
    @location = params[:location]

    # Return an array with ponies within a 300km radius around the selected location
    @ponies = Pony.near(params[:location],300)
    @ponies.each do |pony|
      # Narrows down the previous array so it only shows ponies that are available to rent in the selected time interval
      if !pony.pony_offers.where(most_recent: true).first.check_availability(@booking)
        @available_offers << pony.pony_offers.where(most_recent: true).first
      end

    end
  end
end
