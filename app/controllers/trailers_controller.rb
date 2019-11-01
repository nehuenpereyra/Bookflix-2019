class TrailersController < ApplicationController
    def new
        @trailer = Trailer.new
    end

    def create
        #render plain: params[:trailer].inspect
        
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
        @trailer = Trailer.find(params[:id])
    end

    def update
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
        redirect_to trailers_path
    end

    private
    def trailer_params
        params.require(:trailer).permit(:document, :normal_release_date, :premium_release_date)
    end
end
