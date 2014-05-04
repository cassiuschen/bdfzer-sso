class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action CASClient::Frameworks::Rails::Filter, if: :sign_up?
  before_action :check_phone
  after_action :store_location
  #layout :to_phone
  
  private
  def sign_up?
    !!((controller_name == 'registrations'))
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :pku_id, :email]
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :pku_id, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:pku_id, :email, :password, :password_confirmation, :current_password) }
  end

  def check_phone
    request.variant = :phone if !!(request.user_agent =~ /iPhone/)
  end

  def to_phone
    if request.variant == :phone
      'layouts/ionic'
    else
      'layouts/application'
    end
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (!request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
end
#request.fullpath != "/users/sign_in" &&
#        request.fullpath != "/users/sign_up" &&
#        request.fullpath != "/users/password" &&
#        request.fullpath != "/users/sign_out" &&
