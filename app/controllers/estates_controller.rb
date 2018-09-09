class EstatesController < ApplicationController

  def index
  end

  def new
    redirect_back fallback_location: root_path unless user_signed_in? # "fallback_location" redirect to root if no previous page
    redirect_back fallback_location: root_path if current_user.pro == "nil"
    @estate = Estate.new
    @estate_attachment = @estate.product_attachments.build
    @products = current_user.products
  end

  def create
    @estate = Estate.new(estate_params)
    @estate.user = current_user
    if @estate.save!
      redirect_to current_user
      params[:product_attachments]["gallery"].each do |a|
        @estate_attachment = @estate.product_attachments.create!(:gallery => a)
      end
    else
      render 'new'
    end
  end

  def show
    @estate = Estate.find(params[:id])
    @user = @estate.user
    @attachment = @estate.product_attachments.all
    @products = @estate.products
  end

  def destroy
  end

  private
  def estate_params
    params.require(:estate).permit(:title, :products, :estate_class, :product_attachments, :facilities, :description)
  end

end
