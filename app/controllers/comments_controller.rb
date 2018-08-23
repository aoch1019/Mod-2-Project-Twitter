class CommentsController < ApplicationController

  def index
    @comments = Tweet.find(params[:tweet_id]).comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
    @tweet = Tweet.find(params[:tweet_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      if params[:comment][:origin] == "user_show"
        redirect_to user_path(@comment.tweet.user)
      elsif params[:origin] == "feed"
        redirect_to feed_path
      else
        redirect_to user_tweet_path(User.find(params[:user_id]), Tweet.find(params[:tweet_id]))
      end
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :tweet_id, :user_id)
  end

end
