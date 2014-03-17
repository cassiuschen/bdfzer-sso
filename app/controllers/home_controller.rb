class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def about
  end

  def status
  end

  def list
  end
end
