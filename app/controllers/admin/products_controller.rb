class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:index, :new, :create, :show, :edit, :update]
  before_action :set_genres, only: [:index, :create, :edit, :update]
  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :genre_id, :price, :explanation, :status, :image)
  end

  def set_genres
    @genres = Genre.where(is_valid: true)
  end

end
