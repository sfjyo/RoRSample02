class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update, :show]

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.create(shop_params)
    if @shop.save
      @shop.sales.create(price: 0)
      Product.all.each do |product|
        product.shops << @shop
      end
      redirect_to @shop
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to @shop
    else
      render :edit
    end
  end

  def show
  end



  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :store_name)
  end

end
