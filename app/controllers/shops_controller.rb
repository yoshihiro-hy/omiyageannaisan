class ShopsController < ApplicationController
  before_action :set_shop, only: %i[edit update destroy]
  before_action :set_rodging, only: %i[create edit index search]

  def index
    @shops = @rodging.shops.all
  end
   
  def new; end

  def create
    @shop = @rodging.shops.build(shop_params)
    
    if @shop.save
      redirect_to rodging_shops_path
    else
      render :search
    end
  end

  def edit; end

  def update
    if @shop.update(shop_params)
      redirect_to rodging_shops_path
    else
      reder :edit
    end
  end

  def destroy
    @shop.destroy!
    redirect_to rodging_shops_path
  end

  def search
    @shop = Shop.new
  end

  private

  def set_rodging
    @rodging = current_user.rodgings.find(params[:rodging_id])
  end

  def set_shop
    @rodging = current_user.rodgings.find(params[:rodging_id])
    @shop = @rodging.shops.find(params[:id])
  end
  
  def shop_params
    params.require(:shop).permit(:latitude, :longitude, :address).merge(rodging_id: params[:rodging_id])
  end
end
