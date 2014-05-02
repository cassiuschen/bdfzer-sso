class MobileController < ApplicationController
  before_action :authenticate_user!, except: :index
  layout 'layouts/ionic'
  def index
  end

  def dashboard
  end
end
