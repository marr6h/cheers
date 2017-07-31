class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
      @user = current_user
      @posts = Post.where(user_id: @user.id)
      @index = 0
  end
end
