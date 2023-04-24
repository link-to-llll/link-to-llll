class Public::CartItemsController < ApplicationController
before_action :authenticate_customer!


  def index
   @cart_items = CartItem.all
  end


  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
    @have_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
    if @have_item
       @total_quantity = @have_item.quantity.to_i + params[:cart_item][:quantity].to_i
       @have_item.update(quantity:@total_quantity)
       redirect_to cart_items_path
    
    elsif @cart_items.save
          redirect_to cart_items_path
    end
  end

  def edit
    @cart_items = @cart_items.find(params[:id])
  end

  def update
      @cart_items = CartItem.find(params[:id])
       if @cart_items.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :edit
    end
  end


 def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
 end

def all_destroy  #カート内全て削除
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
end

  private
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
  end
end
