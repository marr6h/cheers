class UsersController < ApplicationController
    def search
        if params[:email]
            @users = User.where(email: params[:email])
        end
    end
end
