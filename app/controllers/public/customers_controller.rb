class Public::CustomersController < ApplicationController
  protect_from_forgery
  before_action :authenticate_customer!
  
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
	def update
    @customer = current_customer
	  if @customer.update(customer_params)
       flash[:success] = "登録情報を変更しました"
       redirect_to customers_path
    else
       render :edit #and return
    end
  end
  
  def quit
  end
  
  def withdraw
    @customer = current_customer
    @customer.update(status: false)

    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  private

	def customer_params
  	params.require(:customer).permit(:email, :family_name, :personal_name, :family_name_kana, :personal_name_kana, :post_code, :address, :phone_number)
  end
  
end
