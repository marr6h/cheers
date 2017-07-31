class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
      @user = current_user
      @posts = Post.where(user_id: @user.id)
      @index = 0
  end

  def user
    @user = current_user
    if @user.nil?
      @user = User.where(username: params['username'])
    end
  end
end
