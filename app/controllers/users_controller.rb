
class UsersController < ApplicationController
    def index
        @user = current_user
    end

    def search
    end

    def user_search
        @users = {}
        if params[:email].present?
            @users = User.where('email LIKE ?', "%#{params[:email]}%").order('created_at DESC').limit(10)
        end
        respond_to do |format|
            format.json {render json: @users.as_json}
            format.any
        end
    end

    def follow
        status = false
        user = current_user
        other_user = params.include?(:id) ? User.find(params[:id]) : nil
        unless other_user.nil?
            unless user.following?(other_user)
                user.follow(other_user)
                status = true
            end
        end
        respond_to do |format|
            format.json {render json: {'status': status}}
            format.any
        end
    end

    def unfollow
        status = false
        user = current_user
        other_user = params.include?(:id) ? User.find(params[:id]) : nil
        unless other_user.nil?
            if user.following?(other_user)
                user.unfollow(other_user)
                status = true
            end
        end
        respond_to do |format|
            format.json {render json: {'status': status}}
            format.any
        end
    end
end
