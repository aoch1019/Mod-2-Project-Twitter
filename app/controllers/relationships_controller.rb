class RelationshipsController < ApplicationController

  def create
    followed_user = User.find(params[:followed_id])
    current_user.follow(followed_user)
    redirect_to followed_user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
