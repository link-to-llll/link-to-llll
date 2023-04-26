class Admin::OrdersController < ApplicationController



  def index
    @order = Order.find(params[:order_id])
  end

  def show
   @order = Order.find(params[:id])
   @customer = Customer.find(params[:id])
   @sum = 0
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

private

  def order_params
    params.require(:order).permit(:status)
  end

end
