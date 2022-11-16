class RodgingsController < ApplicationController
  before_action :set_rodging, only: %i[destroy show]

  def index
    @rodgings = Rodging.all
  end

  def new
    @rodging = Rodging.new
  end

  def create
    @rodging = Rodging.new(rodging_params)
    if @rodging.save
      redirect_to rodging_path
    else
      render :new
    end
  end

  def show; end

  def destroy
    @place.destroy
    redirect_to rodgings_path
  end

  private

  def set_rodging
    @rodging = Rodging.find(params[:id])
  end

  def rodging_params
    params.require(:rodging).permit(:name, :latitude, :longitude, :address)
  end
end
