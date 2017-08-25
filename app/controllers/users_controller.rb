class UsersController < ApplicationController
    def index
        @user = current_user
    end
    def search
        if params[:email]
            @users = User.where('email LIKE ?', "%#{params[:email]}").order('created_at DESC').limit(User::SEARCH_LIMIT)
        end
    end
end
