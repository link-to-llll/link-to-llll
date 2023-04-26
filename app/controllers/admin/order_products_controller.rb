class Admin::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order
    if @order_product.update(order_product_params)

      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:status)
  end
end
