class RodgingsController < ApplicationController
  before_action :set_rodging, only: %i[edit update destroy]

  def index
    @rodgings = current_user.rodgings.all
  end

  def new
    @rodging = Rodging.new
  end

  def create
    @rodging = current_user.rodgings.build(rodging_params)
    if @rodging.save
      redirect_to search_rodging_shops_path(@rodging), success: t('defaults.message.created', item: Rodging.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Rodging.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @rodging.update(rodging_params)
      redirect_to rodgings_path, success: t('defaults.message.updated', item: Rodging.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Rodging.model_name.human)
      render :edit
    end
  end

  def destroy
    @rodging.destroy!
    redirect_to rodgings_path, success: t('defaults.message.deleted', item: Rodging.model_name.human)
  end

  private

  def set_rodging
    @rodging = current_user.rodgings.find(params[:id])
  end

  def rodging_params
    params.require(:rodging).permit(:latitude, :longitude, :address, :start_time, :end_time, :shopping_day)
  end
end
