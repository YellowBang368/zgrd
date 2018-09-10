class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @session = Product.new
    @products = Product.all
    @index_products = []
    @products.each do |pr|
      @index_products << pr if pr.hot
    end
    @products.each do |pr|
      @index_products << pr if pr.hot == nil || pr.hot == false
    end
  end

  def new
    redirect_back fallback_location: root_path unless user_signed_in? # "fallback_location" redirect to root if no previous page
    @product = Product.new
    @product_attachment = @product.product_attachments.build
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save!
      redirect_to current_user
      params[:product_attachments]["gallery"].each do |a|
        @product_attachment = @product.product_attachments.create!(:gallery => a)
      end
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
    @user = @product.user
    @related_products = Product.all.sample(5)
    @product_attachment = @product.product_attachments.all
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :avatar, :square, :gas, :electricity, :sewerage, :product_attachments)
  end

  def form_1_submit
    session[:value] = params[:value]
    redirect_to form_2
 end

end
