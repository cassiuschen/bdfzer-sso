class Api::V1::TweetController < Api::V1::BaseController
  #doorkeeper_for :all

  def create
    user = User.where(id: user_params).first
    @tweet = user.tweets.new
    @tweet.body = tweet_body
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: 'tweet was successfully created.' }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, notice: 'tweet was hardly created.'}
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def tweet_body
    params[:tweet]
  end

  def user_params
    params[:user].to_i
  end
end
