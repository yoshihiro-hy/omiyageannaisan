class RodgingsController < ApplicationController
  before_action :set_rodging, only: %i[destroy show]

  def index
    @rodgings = Rodging.all
  end

  def new
    @rodging = Rodging.new
  end

  def create
    @rodging = current_user.rodgings.build(rodging_params)
    if @rodging.save
      redirect_to rodging_path(@rodging)
    else
      render :new
    end
  end

  def show; end

  def destroy
    @rodging.destroy
    redirect_to rodgings_path
  end

  private

  def set_rodging
    @rodging = current_user.rodgings.find(params[:id])
  end

  def rodging_params
    params.require(:rodging).permit(:latitude, :longitude, :address, :start_time, :end_time, :shopping_day)
  end
end
