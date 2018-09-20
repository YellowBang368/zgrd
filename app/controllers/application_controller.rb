class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale, if: :session_locale_present?

  def set_locale
    I18n.locale = session[:locale]
  end

  def change_locale
    session[:locale] = params[:locale]
    redirect_back fallback_location: root_path
  end

  def change_currency
    session[:currency] = params[:currency]
    redirect_back fallback_location: root_path
  end

  def session_locale_present?
    session[:locale].present?
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:first_name, :last_name, :email, :phone, :password)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end
  end


end
