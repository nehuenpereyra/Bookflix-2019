class AuthorsController < ApplicationController
    before_action :authenticate_administrator! , except: [:show] || :authenticate_subscriber!

    def new
        @author = Author.new
    end

    def create
        #render plain: params[:author].inspect
        @author = Author.new(author_params)
        if @author.save
            redirect_to @author
        else
                render 'new'
        end
    end

    def show
        @author = Author.find(params[:id])
        @books = @author.books
    end

    def index
        @authors = Author.all
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update
        @author = Author.find(params[:id])
        if @author.update(author_params)
        redirect_to @author
        else
        render 'edit'
        end
    end

    def destroy
        @author = Author.find(params[:id])
        title = @author.name
        if @author.destroy
            redirect_to authors_path(removed: title)
        else
            redirect_to authors_path(error_removed: title)
        end
    end

    private
    def author_params
        params.require(:author).permit(:name)
    end
end
