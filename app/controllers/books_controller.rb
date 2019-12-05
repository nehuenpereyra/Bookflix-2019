class BooksController < ApplicationController

    before_action :authenticate_administrator!, except: [:show, :index, :favorite_book,:unfavorite_book], if: :subscriber_signed_in?
    before_action :authenticate_scope!


    def new
        @book = Book.new
        @genres = Genre.all
        @tags = Tag.all
        @editorials = Editorial.all
        @authors = Author.all
    end

    def create
        #render plain: params[:book]
        #render plain: book_params
        @genres = Genre.all
        @tags = Tag.all
        @editorials = Editorial.all
        @authors = Author.all
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
        @reviews = Review.all
        @book_finish = book_finish(@book)

        if cookies[:current_profile_id] != nil
            @favorite = Favorite.find_by(book_id: params[:id],profile_id:cookies[:current_profile_id])
        end 
    end

    def index
        @books = Book.all
        if params[:search].present?
            @books=@books.where("title like ?", "%#{params[:search]}%")
         end
    end

    def edit
        @genres = Genre.all
        @editorials = Editorial.all
        @authors = Author.all
        @book = Book.find(params[:id])
    end

    def update
        @genres = Genre.all
        @editorials = Editorial.all
        @authors = Author.all
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
        title = @book.title
        @book.update_attribute(:visibility,false)
        redirect_to books_path(removed: title)
    end





    def favorite_book
        if cookies[:current_profile_id] != nil
            favorite = Favorite.new(ok:true,book_id:params[:id].to_i,profile_id:cookies[:current_profile_id].to_i)
            if favorite.save
                book = favorite.book
                redirect_to :controller => 'books', :action => 'show', :id => params[:id]
            else
                redirect_to root_path
            end
        end
    end

    def unfavorite_book
        if cookies[:current_profile_id] != nil
            favorite = Favorite.find_by(book_id:params[:id]) 
            favorite.destroy
            redirect_to :controller => 'books', :action => 'show', :id => params[:id]
        end
    end





    private
    def book_params
        params.require(:book).permit(:title, :description, :expiration_date, :url_cover, :author_id, :editorial_id, :genre_id, :tag_ids => [])
    end

    def book_finish(book)
        readings = Reading.all.select { |element| element.profile_id == cookies[:current_profile_id].to_i }
        return book.parts.any? { |part| readings.any?{ |reading| reading.part_id == part.id} } && book.parts.size == readings.count{ |r| book.parts.any?{|i| i.id == r.part_id}  }
    end
    
end
