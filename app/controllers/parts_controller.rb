class PartsController < ApplicationController

    before_action :authenticate_administrator!

    def new
        @part = Part.new
        @books = Book.all
    end

    def create
        #render plain: params[:part].inspect
        @books = Book.all
        @part = Part.new(part_params)
        if @part.save
            redirect_to @part
        else
                render 'new'
        end
    end

    def show
        @part = Part.find(params[:id])
    end

    def index
        @parts = Part.all
    end

    def edit
        @books = Book.all
        @part = Part.find(params[:id])
    end

    def update
        @books = Book.all
        @part = Part.find(params[:id])
        if @part.update(part_params)
        redirect_to @part
        else
        render 'edit'
        end
    end

    def destroy
        @part = Part.find(params[:id])
        @part.destroy
        redirect_to parts_path
    end

    private
    def part_params
        params.require(:part).permit(:document, :position, :normal_release_date, :premium_release_date, :book_id, :url_document)
    end
end
