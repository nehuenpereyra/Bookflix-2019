class EditorialsController < ApplicationController
    before_action :authenticate_administrator! , except: [:show] || :authenticate_subscriber!

    def new
        @editorial = Editorial.new
    end

    def create
        #render plain: params[:editorial].inspect
        @editorial = Editorial.new(editorial_params)
        if @editorial.save
            redirect_to @editorial
        else
                render 'new'
        end
    end

    def show
        @editorial = Editorial.find(params[:id])
        @books = @editorial.books
    end

    def index
        @editorials = Editorial.all
    end

    def edit
        @editorial = Editorial.find(params[:id])
    end

    def update
        @editorial = Editorial.find(params[:id])
        if @editorial.update(editorial_params)
        redirect_to @editorial
        else
        render 'edit'
        end
    end

    def destroy
        @editorial = Editorial.find(params[:id])
        title = @editorial.name
        if @editorial.destroy
            redirect_to editorials_path(removed: title)
        else
            redirect_to editorials_path(error_removed: title)
        end
    end

    private
    def editorial_params
        params.require(:editorial).permit(:name)
    end
end
