class Api::V1::AngularController < Api::V1::BaseController
  before_action :check_angular, except: [:current_info]

  def users
    @users = @fail || User.all
    render json: @users
  end

  def user
    @user = @fail || User.find_by_pku_id(session[:pku_id])
    render json: @user
  end

  def current_info
    hash = {
      pku_id: session[:pku_id],
      name:   session[:name],
      id:      session[:id] 
    }

    render json: hash
  end

  private
  def check_angular
    unless params[:angular_secret].to_s == $app_config['angular_secret']
      @fail = 'Access Deny'
    end
  end
end
