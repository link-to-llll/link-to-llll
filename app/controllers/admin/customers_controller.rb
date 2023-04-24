class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
    @products = @customer.products.page(params[:page])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path, notice: "You have updated user successfully."
    else
      # render "show"
      render :edit
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:email, :family_name, :personal_name, :family_name_kana,
      :personal_name_kana, :post_code, :address, :phone_number, :status)
  end
  
end
