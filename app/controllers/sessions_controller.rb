class SessionsController < ApplicationController
  skip_before_action :authorized, except: :destroy

  def new
    # don't need anything in here, cause we're not setting up a
    # blank model to couple with the form
  end

  def create
    # no strong params cause there is no mass assignment
    @user = User.find_by({email: params[:email]})
    if !!@user && @user.authenticate(params[:password])
      flash[:notice] = "Successfully logged in #{@user.name}!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
