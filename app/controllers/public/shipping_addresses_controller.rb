class Public::ShippingAddressesController < ApplicationController


  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = current_customer.shipping_addresses
  end

   def create
    @shipping_address = ShippingAddress.new(shipping_address_params) #current_customer.shipping_addresses.new...
      @shipping_address.customer_id = current_customer.id
    if @shipping_address.save!
    redirect_to shipping_addresses_path, notice: "You have created book successfully."
    else
      render 'index'
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path(@shipping_address), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

 def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to shipping_addresses_path
  end

  private

  def shipping_address_params
  params.require(:shipping_address).permit(:name, :post_code, :address)
  end
end
