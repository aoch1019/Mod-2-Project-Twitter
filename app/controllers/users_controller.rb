class UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :new, :create]
  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @comment = Comment.new
    render :show
  end

  def profile
    @user = User.find_by(id: session[:user_id])
    @comment = Comment.new
    render :show
  end

  def new
    @user = User.new
    render :layout => 'login'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signup successful. Welcome!"
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    render :layout => 'login'
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Successfully updated profile"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to new_user_path
  end

  def followers
    user = User.find(params[:id])
    @followers = user.followers
    render 'show_followers'
  end

  def following
    user = User.find(params[:id])
    @following = user.following
    render 'show_following'
  end

  def feed
    @comment = Comment.new
    if params[:origin] == "feed"
      @tweets = params[:feed_order].map do |tweet_id|
        Tweet.find(tweet_id.to_i)
      end
    else
      @tweets = randomize_order(current_user.tweets_followed)
    end
  end

  private

  def randomize_order(tweets)
    random_order = []

    counter = 0
    chosen_nums = []

    until counter == tweets.length
      random_index = rand(0..(tweets.length-1))
      until chosen_nums.include?(random_index) == false
        random_index = rand(0..(tweets.length-1))
      end
      chosen_nums << random_index
      random_order << tweets[random_index]
      counter += 1
    end

    return random_order
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :profile_pic)
  end
end
