class BooksController < ApplicationController

    def new
    end

    def create
        render plain: params[:book].inspect
    end

    def show  
    end

    def index 
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
