class HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'layouts/dashboard'
  def index
    @ng_controller = "home"
  end

  def about
  end

  def status
  end

  def list
  end
end
