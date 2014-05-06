class Api::V1::FeedController < Api::V1::BaseController
  #doorkeeper_for :all
  def show
    @feed = User.where(pku_id: user_params).first.feeds.sort {|f| Time.now - f.created_at}
    render json: @feed
  end

  private
  def user_params
    params[:user]
  end
end
