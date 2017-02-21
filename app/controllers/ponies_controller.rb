class PoniesController < ApplicationController
  def index
   @pony = Pony.where(user_id: current_user.id)
  end

  def show
    @pony = Pony.find(params[:id])
  end

  def new
    @pony = Pony.new
  end

  def create
    @pony = Pony.new(pony_params)
    @pony.user = current_user
    if @pony.save
      redirect_to pony_path(@pony)
    else
      @error = @pony.errors
      render :new
    end
  end

  def edit
    @pony = Pony.find(params[:id])
  end

  def update
    Pony.find(params[:id]).update(pony_params)
    redirect_to pony_path
  end

  def destroy
    Pony.find(params[:id]).destroy
    redirect_to ponies_path
  end


  private

  def pony_params
    params.require(:pony).permit(:name, :description, :race, :color, :location, :photo)
  end
end

