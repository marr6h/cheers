class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    unless user_signed_in?
      render :file => 'layouts/front.html.haml', :layout => false
      return
    end
    @user = current_user
    @posts = @user.aggregate_post
  end

  def user
    @user = current_user
    if @user.nil?
      @user = User.where(username: params['username'])
    end
    @following = @user.following
    @entries = Entry.where(post_id: @user.latest_post)
  end

  def following
    @user = current_user
    @following = @user.following
  end
end
