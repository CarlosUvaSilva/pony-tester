class BookingsController < ApplicationController
  def index
    @rented_bookings = current_user.rented_bookings
    @owned_bookings = current_user.owned_bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @pony_offer = PonyOffer.find(params[:pony_offer_id])
    @pony = @pony_offer.pony
    @booking = Booking.new(booking_params(params))
    @price = @booking.duration * @pony_offer.daily_rate
    @to_disable_dates = @pony_offer.unavailable_dates
    @error = !@pony_offer.available?(@booking)
  end

  def create
    @pony_offer = PonyOffer.find(params[:pony_offer_id])
    @pony = @pony_offer.pony
    @booking = Booking.new(booking_params(params))
    @booking.price = @booking.duration * @pony_offer.daily_rate
    @booking.user = current_user
    @booking.pony_offer = @pony_offer
    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy
  end

  private

  def booking_params(params)
    {start_date: Date.parse(params[:booking][:start_date]), end_date: Date.parse(params[:booking][:end_date])}
  end
end
