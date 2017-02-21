class PonyOffersController < ApplicationController

  before_action :set_pony_offer, only: [:show, :destroy]


  # method do list all offers from one user
  def index
    @pony_offers = current_user.owned_pony_offers
    @active_pony_offers = @pony_offers.where(most_recent: true)
  end

  # method do list all offers associated with one pony
  def list
    @pony = Pony.find(params[:pony_id])
    @pony_offers = @pony.pony_offers
  end

  # Done
  def show
  end

  def new
    # User can only create a new offer if the pony belongs to him, if not redirect user to the root
    @pony = Pony.find(params[:pony_id])
    if @pony.user.id == current_user.id
      @pony_offer = PonyOffer.new
    else
      redirect_to root_path, notice: "Selected pony does not belong to current user"
    end
  end

  def create
    @pony_offer = PonyOffer.new(pony_offer_params)
    @pony_offer.most_recent = true
    @pony = Pony.find(params[:pony_id])
    @pony_offer.pony = @pony


    if @pony_offer.save
      redirect_to root_path, notice: "Pony offer was successfully created"
    else
      render :new
    end

  end

  def destroy
    @pony_offer.destroy
    redirect_to pony_offers_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pony_offer
      @pony_offer = PonyOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pony_offer_params
      params.require(:pony_offer).permit(:start_date, :end_date, :daily_rate)
    end

end
