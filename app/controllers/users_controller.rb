class UsersController < ApplicationController
    def index
        @user = current_user
    end
    def search
        if params[:email]
            @users = User.where(email: params[:email])
        end
    end
end
