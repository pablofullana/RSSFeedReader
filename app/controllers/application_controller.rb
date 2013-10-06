class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery with: :exception
  
  
  protected
  
  def configure_permitted_parameters
  	# sign_in
  	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
  	# sign_up
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :first_name, :last_name, :email, :password, :password_confirmation) }
  	# update user account
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:login, :first_name, :last_name, :email, :password, :password_confirmation, :current_password) }  	
  end


end
