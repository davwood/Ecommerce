class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :create_empty_cart
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart



  def create_empty_cart
  	session[:cart_id] ||= Cart.create.id  
  end	

  def current_cart
  	Cart.find session[:cart_id]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
  end
end
