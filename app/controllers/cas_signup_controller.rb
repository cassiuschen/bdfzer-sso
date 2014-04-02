class CasSignupController < ApplicationController
  before_action CASClient::Frameworks::Rails::Filter
  def create
    @current_id = session[:cas_user]
    @user = User.new(cas_params)

    respond_to do |f|
    	if @user.save
    		f.html { redirect_to root_path, notice: '用户创建成功！' }
    		#f.json { render action: 'show', status: :created, location: @user }
    	else
    		f.html { render action: 'new', warning: '用户创建失败' }
    		#format.json { render json: @user.errors, status: :unprocessable_entity }
    	end
    end

  end

  def index
  	@current_id = session[:cas_user]
  	@user = User.new
  end

  private
  def cas_params
  	params.permit(:email, :pku_id, :password, :password_confirmation, :name)
  end
end
