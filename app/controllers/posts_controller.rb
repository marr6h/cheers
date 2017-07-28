class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(user_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
        def user_params
             params.require(:post).permit(:location, :remarks)
        end

end
