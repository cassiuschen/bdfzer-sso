class Api::V1::TweetController < Api::V1::BaseController
  #doorkeeper_for :all

  def create
    user = User.where(id: user_params.to_i).first
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

  def delete
    @tweet = Tweet.where(id: tweet_id_params).first
    respond_to do |format|
      if @tweet.destroy!
        format.html { redirect_to root_path, notice: 'tweet was successfully delete.' }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, notice: 'tweet was hardly delete.'}
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    params[:area] ||= "public"
    @out =[]
    case params[:area]
    when "public"
      @tweets = Tweet.all.sort_by {|t| Time.now - t.created_at}
    when "personal"
      @tweets = User.where("pku_id = ?", params[:user]).first.tweets.sort_by {|t| Time.now - t.created_at}
    else
      @tweets = User.where("pku_id = ?", params[:user]).first.tweets.sort_by {|t| Time.now - t.created_at}
    end
    @tweets.each do |t|
      user = User.where("id = ?", t.user_id).first
      @out << {
        "body" => t.body,
        "date" => t.created_at,
        "user" => {
          "name" => user.name,
          "avatar" => user.avatar.url
        }
      }
    end
    render json: @out
  end

  private
  def tweet_body
    params[:tweet]
  end

  def user_params
    params[:user]
  end

  def tweet_id_params
    params[:tweet_id].to_i
  end
end
