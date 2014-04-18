class SettingController < ApplicationController
  before_action :authenticate_user!
  layout 'layouts/setting_dashboard'

  def user
  	@user = current_user
  	@title = "用户设置"
  	@sub_title = "在这里更改用户相关设置"
  end

  def extra
  end

  def application
  end
end
