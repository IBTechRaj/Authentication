class PostsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create]
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = session[:user_id]
        if @post.save
            flash[:success] = "Your Post has been created!"
            redirect_to root_path
        else
            render 'new'
        end
    end

    def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end

end
