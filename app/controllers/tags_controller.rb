class TagsController < ApplicationController

    before_action :authenticate_administrator! , except: [:show]
    before_action :authenticate_subscriber!

    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(tag_params)
        if @tag.save
            redirect_to @tag
        else
                render 'new'
        end
    end

    def show
        @tag = Tag.find(params[:id])
        @books = @tag.books
    end

    def index
        @tags = Tag.all
    end

    def edit
        @tag = Tag.find(params[:id])
    end

    def update
        @tag = Tag.find(params[:id])
        if @tag.update(tag_params)
        redirect_to @tag
        else
        render 'edit'
        end
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to tags_path
    end

    private
    def tag_params
        params.require(:tag).permit(:title)
    end
end
