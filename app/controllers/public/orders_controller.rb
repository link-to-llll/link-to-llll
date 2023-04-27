class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def log
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    customer = current_customer
    address_option = params[:order][:shipping_postal_code_option].to_i

    @order.payment_method = params[:order][:payment_option].to_i
    #@order.temporary_information_input(customer.id)

    if address_option == 0
      # @order.order_in_post_code_address_name(customer.post_code, customer.address, customer.family_name)
      @order.shipping_postal_code = customer.post_code
      @order.shipping_address = customer.address
      @order.shipping_name = customer.family_name + customer.personal_name
    elsif address_option == 1
      shipping = ShippingAddress.find(params[:order][:shipping_postal_code])
      #@order.order_in_postcode_address_name(shipping.shipping_postcode, shipping.shipping_address, shipping.shipping_name)
      @order.shipping_postal_code = shipping.post_code
      @order.shipping_address = shipping.address
      @order.shipping_name = shipping.name
    elsif address_option == 2
      @shipping_address = ShippingAddress.new(shipping_address_params) #current_customer.shipping_addresses.new...
      @shipping_address.customer_id = current_customer.id
      @shipping_address.save!
      @order.shipping_postal_code = @shipping_address.post_code
      @order.shipping_address = @shipping_address.address
      @order.shipping_name = @shipping_address.name
    else
    end
    #kここは商品の値が入ってから追加
    # unless @order.valid?
    #   flash[:danger] = "お届け先の内容に不備があります<br>・#{@order.errors.full_messages.join('<br>・')}"
    #   p @order.errors.full_messages
    #   redirect_back(fallback_location: root_path)
    # end
    # render plain: @order.inspect
  end
  def index
    #@orders = Orders.all
    #@orders = current_customer.order_id
     @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end
  def show
     @order = Order.find(params[:id])
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        order_product = OrderProduct.new
        order_product.product_id = cart_item.product_id
        order_product.order_id = @order.id
        order_product.quantity = cart_item.quantity
        order_product.buy_price = (cart_item.product.price*1.1).round
        order_product.status = 0
        if order_product.save
          @cart_items.destroy_all
        end
      end
      redirect_to orders_thanks_path
    else
    end
  end

  def order_params
    params.require(:order).permit(:shipping_name, :shipping_address, :amount_billed, :shipping_postal_code, :payment_method, :postage)
  end
  def shipping_address_params
    params.require(:shipping_address).permit(:name, :post_code, :address)
  end

end