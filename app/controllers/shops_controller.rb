class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show destroy]
  before_action :set_rodging, only: %i[new search]
   
  def new; end

  def create
    @shop = Shop.new(shop_params)
    
    if @shop.save
      redirect_to rodging_path
    else
      render :new
    end
  end

  def show; end

  def destroy
    @shop.destroy
    redirect_to rodging_path
  end

  def search; end

  private

  def set_rodging
    @rodging = current_user.rodgings.find(params[:rodging_id])
  end

  def set_shop
    @shop = current_user.rodgings.shops.find(params[:id])
  end
  
  def shop_params
    params.require(:shop).permit(:latitude, :longitude, :address)
  end
end
