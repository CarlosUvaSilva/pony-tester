class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @pony_offer = PonyOffer.find(params[:pony_offer_id])
    @pony = @pony_offer.pony
    @booking = Booking.new(booking_params(params))
    @price = @booking.duration * @pony_offer.daily_rate
    @to_disable_dates = @pony_offer.unavailable_dates
    @to_disable_dates.unshift((Date.today - 1).strftime('%-m-%-d-%Y'))
    @error = @pony_offer.check_availability(@booking)
  end

  def create
    @pony_offer = PonyOffer.find(params[:pony_offer_id])
    @pony = @pony_offer.pony
    @booking = Booking.new(booking_params(params))
    @booking.price = @booking.duration * @pony_offer.daily_rate
    @booking.user = current_user
    @booking.pony_offer = @pony_offer
    @booking.save
    render 'show'
  end

  def destroy
  end

  private

  def booking_params(params)
    {start_date: Date.parse(params[:booking][:start_date]), end_date: Date.parse(params[:booking][:end_date])}
  end
end
