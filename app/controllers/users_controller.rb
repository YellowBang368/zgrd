class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def get_pro
    current_user.update(pro: "light")
    redirect_to root_path
  end

  def favorite
    redirect_back fallback_location: root_path unless user_signed_in?
  end

  def add_favorite
  end

  def remove_favorite
  end
end
