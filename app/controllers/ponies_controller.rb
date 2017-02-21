class PoniesController < ApplicationController
  def index
   @pony = Pony.all
  end

  def show
    @pony = Pony.find(params[:id])
  end

  def new
    @pony = Pony.new
  end

  def create
    @pony = Pony.new(check_params(params))
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
    Pony.update(check_params(params))
    redirect_to pony_path
  end

  def destroy
    Pony.find(params[:id]).destroy
    redirect_to ponies_path
  end
end

private

def check_params(params)
  {name: params[:pony][:name], color:
    params[:pony][:color], race: params[:pony][:race], user: current_user,
    description: params[:pony][:description],
    location: params[:pony][:location]  }
end
