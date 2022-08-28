class SalesController < ApplicationController
  REGISTRABLE_ATTRIBUTES = %i(id shop_id product_id price)

  def index
    @sales = Sale.order(:shop_id, :product_id)
  end

  # def new
  #   @sales = Product.sales.new
  # end

  # def create
  # end

  def update
    sale_params[:sales_attributes].each do |sale|
      Sale.find(sale[1].to_hash["id"]).update(sale[1])
    end
  end

  private
  def sale_params
    params.require(:shop).permit(:id, [sales_attributes: REGISTRABLE_ATTRIBUTES])
  end
end
