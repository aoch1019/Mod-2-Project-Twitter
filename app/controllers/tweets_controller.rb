class TweetsController < ApplicationController

  def index
    @tweets = User.find(params[:user_id]).tweets
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
    @user = User.find(params[:user_id])
  end

  def create
    @tweet = Tweet.new(tweet_params)
    # @tweet.user_id = params[:user_id]
    if @tweet.save
      redirect_to user_path(User.find(params[:user_id]))
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end

end
