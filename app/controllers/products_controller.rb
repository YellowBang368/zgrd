class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    @products = Product.all
  end

  def new
    redirect_back fallback_location: root_path unless user_signed_in? # "fallback_location" redirect to root if no previous page
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save!
      redirect_to current_user
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :avatar)
  end

end
