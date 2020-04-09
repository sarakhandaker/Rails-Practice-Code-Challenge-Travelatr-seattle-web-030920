class BloggersController < ApplicationController
    def new
        @blogger=Blogger.new
    end
    def create
        @blogger=Blogger.new(blogger_params)
        if @blogger.save
            redirect_to @blogger
        else
            flash[:error_messages]=@blogger.errors.full_messages
            render:new
        end

    end
    def show
        set_blogger
    end
    def index
        @bloggers=Blogger.all
    end
    private 
    def set_blogger
        @blogger=Blogger.find(params[:id])
    end
    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end
end