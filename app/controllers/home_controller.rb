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
    @entries = Entry.where(post_id: @user.latest_post, cheer: 0)
    @cheers = Entry.where(entry_to: @user.id, cheer: 1).or(Entry.where(entry_from: @user.id, cheer: 1))
  end

  def following
    @user = current_user
    @following = @user.following
  end
end
