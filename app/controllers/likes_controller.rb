class LikesController < ApplicationController
  # def new
  #   @like = Like.new
  #   @user = User.find(params[:user_id])
  #   @tweet = Tweet.find(params[:tweet_id])
  # end

  def index
    @likes = Tweet.find(params[:tweet_id]).likes
  end

  def create
    @like = Like.new(user_id: params[:user_id], tweet_id: params[:tweet_id])
    if @like.save
      redirect_to user_tweet_path(User.find(params[:user_id]), Tweet.find(params[:tweet_id]))
    else
      flash[:notice] = "You already liked this Tweet"
      redirect_to user_tweet_path(User.find(params[:user_id]), Tweet.find(params[:tweet_id]))
    end
  end

  # private
  #
  # def like_params
  #   params.require(:like).permit(:tweet_id, :user_id)
  # end

end
