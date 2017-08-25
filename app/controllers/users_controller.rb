class UsersController < ApplicationController
    def index
        @user = current_user
    end

    def search
    end

    def user_search
        @users = {}
        if params[:email]
            @users = User.where('email LIKE ?', "%#{params[:email]}%").order('created_at DESC').limit(10)
        end
        respond_to do |format|
            format.json {render json: @users.as_json}
            format.any
        end
    end
end
