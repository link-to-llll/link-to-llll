class Public::ShippingAddressesController < ApplicationController


  def index
    @shipping_addresses = ShippingAddresses.new
  end

   def create
    @shipping_addresses = ShippingAddresses.new(shipping_address_params)
    @shipping_addresses.custumer_id = current_custumer.id
    if @shipping_addresses.save
    redirect_to shipping_addresses_path(@shipping_addresses), notice: "You have created book successfully."
    else
      @shipping_addresses = @shipping_addresses.all
      render 'index'
    end
  end

  def edit
  end

  def update
  end


  private

  def shipping_address_params
  params.require(:order).permit(:shipping_name, :shipping_postal_code, :shipping_address, :payment_method)
  end
end
