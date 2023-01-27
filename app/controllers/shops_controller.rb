class ShopsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_shop, only: %i[edit update destroy]
  before_action :set_rodging, only: %i[create edit update index search directions]

  def index
    @shops = @rodging.shops.all
  end

  def create
    @shop = @rodging.shops.build(shop_params)

    if @shop.save
      redirect_to rodging_shops_path, success: t('defaults.message.addition', item: Shop.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_addition', item: Shop.model_name.human)
      render :search
    end
  end

  def destroy
    @shop.destroy!
    redirect_to rodging_shops_path, success: t('defaults.message.deleted', item: Shop.model_name.human)
  end

  def search
    @shop = Shop.new
  end

  def directions
    @shops = @rodging.shops.all
    gon.shops = @shops
    gon.rodging = @rodging
  end

  private

  def set_rodging
    @rodging = current_user.rodgings.find(params[:rodging_id])
  end

  def set_shop
    rodging = current_user.rodgings.find(params[:rodging_id])
    @shop = rodging.shops.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:latitude, :longitude, :address).merge(rodging_id: params[:rodging_id])
  end
end
