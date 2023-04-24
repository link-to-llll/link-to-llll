class Public::ProductsController < ApplicationController
  def index
    @products = Product.all
    @products, @sort = get_products(params)
  end
  
  def show
  @product = Product.find(params[:id])
  @cart_item = CartItem.new
  end
 

end
