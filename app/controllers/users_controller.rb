class UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :new, :create]
  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    render :show
  end

  def profile
    @user = User.find_by(id: session[:user_id])
    render :show
  end

  def new
    @user = User.new
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
    render :edit
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
    @user.destroy
    flash[:notice] = "Deleted account for #{@user.username}"
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


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :profile_pic)
  end

end
