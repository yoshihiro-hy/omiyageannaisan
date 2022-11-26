class RodgingsController < ApplicationController
  before_action :set_rodging, only: %i[show destroy]

  def index
    @rodgings = current_user.rodgings.all
  end

  def new
    @rodging = Rodging.new
  end

  def create
    @rodging = current_user.rodgings.build(rodging_params)
    if @rodging.save
      redirect_to search_rodging_shops_path(@rodging), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def show; end

  def destroy
    @rodging.destroy
    redirect_to rodgings_path, success: t('.success')
  end

  private

  def set_rodging
    @rodging = current_user.rodgings.find(params[:id])
  end

  def rodging_params
    params.require(:rodging).permit(:latitude, :longitude, :address, :start_time, :end_time, :shopping_day)
  end
end
