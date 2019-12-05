class PartsController < ApplicationController

    before_action :authenticate_administrator!, except: [:show, :reading_part,:unreading_part], if: :subscriber_signed_in?
    before_action :authenticate_scope!

    def new
        #render plain: params[:part].inspect 
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
        if cookies[:current_profile_id] != nil
            @reading = Reading.find_by(part_id: params[:id],profile_id:cookies[:current_profile_id])
        end
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
        id_book = @part.book.id 
        @part.destroy
        #redirect_to parts_path
        redirect_to :controller => 'books', :action => 'show', :id => params[:book_id], :removed_part => @part.position
    end

    def reading_part
        if cookies[:current_profile_id] != nil
            reading = Reading.new(state:'READ',part_id:params[:id].to_i,profile_id:cookies[:current_profile_id].to_i)
            if reading.save
                part = reading.part
                redirect_to :controller => 'parts', :action => 'show', :id => params[:id]
            else
                redirect_to root_path
            end
        end
    end

    def unreading_part
        if cookies[:current_profile_id] != nil
            reading = Reading.find_by(part_id:params[:id]) 
            reading.destroy
            redirect_to :controller => 'parts', :action => 'show', :id => params[:id]
        end
    end

    private
    def part_params
        params.require(:part).permit(:document, :position, :normal_release_date, :premium_release_date, :book_id, :url_document,:id)
    end
end
