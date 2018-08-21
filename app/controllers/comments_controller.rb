class CommentsController < ApplicationController

  def index
    byebug
    @comments = Tweet.find(params[:id])
  end

end
