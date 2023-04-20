class Admin::ProductsController < ApplicationController
  before_action :set_product
  def index
    @products = Product.all
  end
end
