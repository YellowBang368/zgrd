class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def favorite
    redirect_back fallback_location: root_path unless user_signed_in?
  end

  def add_favorite
  end

  def remove_favorite
  end
end
