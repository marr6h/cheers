class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    unless user_signed_in?
      render :file => 'layouts/front.html.haml', :layout => false
      return
    end
      @user = current_user
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
