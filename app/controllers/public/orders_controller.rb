class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def log
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    customer = current_customer
    address_option = params[:order][:address_option].to_i

    @order.payment_method = params[:order][:payment_option].to_i
    #@order.temporary_information_input(customer.id)

    if address_option == 0
      # @order.order_in_post_code_address_name(customer.post_code, customer.address, customer.family_name)
      @order.shipping_postal_code = customer.post_code
      @order.shipping_address = customer.address
      @order.shipping_name = customer.family_name + customer.personal_name
    elsif address_option == 1
      shipping = ShippingAddress.find(params[:order][:registration_shipping_address])
      #@order.order_in_postcode_address_name(shipping.shipping_postcode, shipping.shipping_address, shipping.shipping_name)
      @oeder.shipping_postal_code = post_code
      @order.shipping_address - address
      @order.shipping_name = name
    elsif address_option == 2
      @order.order_in_postcode_address_name(params[:order][:shipping_postcode], params[:order][:shipping_address], params[:order][:shipping_name])
    else
    end
    unless @order.valid?
      flash[:danger] = "お届け先の内容に不備があります<br>・#{@order.errors.full_messages.join('<br>・')}"
      p @order.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
    # render plain: @order.inspect
  end
  def index
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_fee = 800
    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price_including_tax = change_price_excluding_tax(cart_item.item.price_excluding_tax)
        order_detail.production_status = 0
        if order_detail.save
          @cart_items.destroy_all
        end
      end
      redirect_to orders_thanks_path
    else
    end
  end

end