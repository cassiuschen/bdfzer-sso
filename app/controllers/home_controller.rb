class HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'layouts/dashboard'
  before_action :save_to_session
  def index
    @ng_controller = "home"
    @feeds = current_user.feeds.sort {|f| Time.now - f.created_at}
    @tweets = Tweet.all.sort {|f| Time.now - f.created_at} || []
  end

  def about
  end

  def status
  end

  def list
  end

  private
  def save_to_session
    session[:pku_id] = current_user.pku_id
    session[:name] = current_user.name
    session[:id] = current_user.id
  end
end
