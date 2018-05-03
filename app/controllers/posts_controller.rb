class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def edit
        @post = Post.find(params[:id])
        render :action => 'new'
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to :root
            return
        else
            render 'new'
        end
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            redirect_to :root
        else
            render 'edit'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
      def post_params
        params.require(:post).permit(:datetime, :location)
      end
end
