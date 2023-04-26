class Public::ProductsController < ApplicationController
  def index
    # @products = Product.all
    @products = Product.page(params[:page]).per(8)
  end
  
  def show
  @product = Product.find(params[:id])
  @cart_item = CartItem.new
  end
 

end
