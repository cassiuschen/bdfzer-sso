class SettingController < ApplicationController
  before_action :authenticate_user!
  layout 'layouts/setting_dashboard'

  def user
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to setting_user_path, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'user' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def extra
  end

  def application
  end

  private
  def user_params
    params.require(:user).permit(:email, :avatar, :sex, :phone, :contact => [:qq, :wechat, :renren, :weibo])
  end
end
