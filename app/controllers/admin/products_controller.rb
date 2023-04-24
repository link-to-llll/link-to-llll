class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  before_action :set_genres, only: [:index, :edit, :create, :update]
  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_product_path(@product)
    else
      @genres = Genre.all
      render :new
    end
  end

  def show
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  private


  def product_params
    params.require(:product).permit(:name, :genre_id, :price, :explanation, :status, :image)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end

  def set_genres
    @genres = Genre.all
  end

end
