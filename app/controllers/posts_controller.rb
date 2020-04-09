class PostsController < ApplicationController
    def new
        @post=Post.new
    end
    def create
        @post=Post.new(post_params)
        if @post.save
            @post.update(likes: 0)
            redirect_to @post
        else
            flash[:error_messages] = @post.errors.full_messages
            render :new 
        end
    end

    def show
        set_post
        if params[:click] == "true"
            num=@post.likes+1
            @post.update(likes: num)
            redirect_to @post
        end
    end

    def index
        @posts=Post.all
    end
    def edit
        set_post
    end
    def update
        set_post
        @post.update(post_params)
       if @post.update(post_params)
        redirect_to @post
       else
        flash[:error_messages] = @post.errors.full_messages
        render :edit
       end
    end


    private 
    def set_post
        @post=Post.find(params[:id])
    end
    def post_params
        params.require(:post).permit(:title, :blogger_id, :destination_id, :content)
    end
end