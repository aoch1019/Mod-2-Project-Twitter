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
    @like = Like.new(user_id: session[:user_id], tweet_id: params[:tweet_id])
    if @like.save
      if params[:origin] == "user_show"
        redirect_to user_path(@like.tweet.user)
      elsif params[:origin] == "feed"
        redirect_to feed_path(params: {origin: "feed", feed_order: params[:feed_order]})
      else
        redirect_to user_tweet_path(User.find(params[:user_id]), Tweet.find(params[:tweet_id]))
      end
    else
      flash[:notice] = "You already liked this Tweet"
      redirect_to user_tweet_path(User.find(params[:user_id]), Tweet.find(params[:tweet_id]))
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    if params[:origin] == "user_show"
      redirect_to user_path(like.tweet.user)
    elsif params[:origin] == "feed"
      redirect_to feed_path(params: {origin: "feed", feed_order: params[:feed_order]})
    else
      redirect_to user_tweet_path(User.find(params[:user_id]), Tweet.find(params[:tweet_id]))
    end
  end


  # private
  #
  # def like_params
  #   params.require(:like).permit(:tweet_id, :user_id)
  # end

end
