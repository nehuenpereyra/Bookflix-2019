class BooksController < ApplicationController
    
    before_action :authenticate_administrator!, except: [:index, :show]
    
    def new
        @book = Book.new
        @genres = Genre.all
        @tags = Tag.all
    end

    def create
        #render plain: params[:book]
        #render plain: book_params
        @genres = Genre.all
        @tags = Tag.all
        @book = Book.new(book_params)
        @book.visibility = true
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
        #@book.destroy
        @book.update_attribute(:visibility,false)
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:title, :description, :expiration_date, :url_cover, :autor, :editorial, :genre_id, :tag_ids => [])
    end
    
end
