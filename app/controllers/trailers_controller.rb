class TrailersController < ApplicationController
    
    before_action :authenticate_administrator! , except: [:show] || :authenticate_subscriber!
    
    
    def new
        @trailer = Trailer.new
        @books = Book.all
    end

    def create
        #render plain: params[:trailer].inspect
        @books = Book.all
        @trailer = Trailer.new(trailer_params)
        if @trailer.save
            redirect_to @trailer
        else
                render 'new'
        end
    end

    def show
        @trailer = Trailer.find(params[:id])
    end

    def index
        @trailers = Trailer.all
    end

    def edit
        @books = Book.all
        @trailer = Trailer.find(params[:id])
    end

    def update
        @books = Book.all
        @trailer = Trailer.find(params[:id])
        if @trailer.update(trailer_params)
        redirect_to @trailer
        else
        render 'edit'
        end
    end

    def destroy
        @trailer = Trailer.find(params[:id])
        @trailer.destroy
        redirect_to :controller => 'books', :action => 'show', :id => @trailer.book.id, :removed_trailer => 'true'
        #redirect_to trailers_path
    end

    private
    def trailer_params
        params.require(:trailer).permit(:url_document, :normal_release_date, :premium_release_date, :book_id)
    end
end
