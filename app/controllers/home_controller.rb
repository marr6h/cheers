class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
      @user = current_user
      @user.paginate(page: 10)
  end

  def user
    @user = current_user
    if @user.nil?
      @user = User.where(username: params['username'])
    end
    @following = @user.following
  end

  def following
    @user = current_user
    @following = @user.following
  end
end
