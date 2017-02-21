class PonyOffersController < ApplicationController

  before_action :set_ponyoffer, only: [:show, :destroy]



  def index
    @ponyoffer = PonyOffer.all
  end

  # Done
  def show
  end



  def new
    @poney = Poney.find(params[:poney_id])
    @ponyoffer = PonyOffer.new
  end

  def create
  end

  def destroy
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ponyoffer
      @ponyoffer = PonyOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ponyoffer_params
      params.require(:ponyoffer).permit(:pony_id, :start_date, :end_date, :daily_rate)
    end



end
