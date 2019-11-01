class BooksController < ApplicationController
    def new
        @book = Book.new
        @genres = Genre.all
        @tags = Tag.all
    end

    def create
        #render plain: params[:book].inspect
        @genres = Genre.all
        @tags = Tag.all
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
                render 'new'
        end
    end

    def show
        @book = Book.find(params[:id])
        
    end

    def index
        @books = Book.all
    end

    def edit
        @genres = Genre.all
        @book = Book.find(params[:id])
    end

    def update
        @genres = Genre.all
        @book = Book.find(params[:id])
        if @book.update(book_params)
        redirect_to @book
        else
        render 'edit'
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:title, :description, :expiration_date, :url_cover, :autor, :editorial, :genre_id)
    end
end
