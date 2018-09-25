class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @public_products = @user.products.where(public: true)
    @private_products = @user.products.where(public: false)
  end

  def get_pro
    current_user.update(pro: "light")
    redirect_to root_path
  end

  def update_status
    current_user.status = params[:status]
    current_user.save
    redirect_to current_user
  end

  def favorite
    if user_signed_in?
      @deffered = Product.find(current_user.favorite_ids)
    else
      @deffered = Product.find(session[:favorite])
    end
  end

  def add_to_favorite
    if user_signed_in?
      current_user.favorite_ids << params["product_id"] unless current_user.favorite_ids.include?(params["product_id"])
      current_user.save!
    else
      session[:favorite] << params["product_id"] unless session[:favorite].include?(params["product_id"])
    end
  end

  def remove_from_favorite
    if user_signed_in?
      current_user.favorite_ids.delete(params["product_id"]) if current_user.favorite_ids.include?(params["product_id"])
      current_user.save!
    else
      session[:favorite].delete(params["product_id"]) if session[:favorite].include?(params["product_id"])
    end
  end
end
