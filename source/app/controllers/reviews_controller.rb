class ReviewsController < ApplicationController

    before_action :authenticate_scope!

    def new
        #render plain: params[:review].inspect
        if !administrator_signed_in?
            @review = Review.new
        else
            redirect_to root_path
        end
    end

    def create
        #render plain: params[:review].inspect        
        @review = Review.new(review_params)
        if @review.save
            redirect_to :controller => 'books', :action => 'show', :id => @review.book.id
        else
                render 'new'
        end
    end

    def show
        @review = Review.find(params[:id])
        redirect_to :controller => 'books', :action => 'show', :id => @review.book.id
    end

    def index
        if params[:collection] != nil
            @reviews = Review.all
        else
            redirect_to root_path
        end
    end

    def edit
        @review = Review.find(params[:id])
        if @review.profile.id != cookies[:current_profile_id].to_i
            redirect_to :controller => 'books', :action => 'show', :id => @review.book.id
        end
    end

    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to :controller => 'books', :action => 'show', :id => @review.book.id
        else
        render 'edit'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        if @review.profile.id != cookies[:current_profile_id].to_i
            redirect_to :controller => 'books', :action => 'show', :id => @review.book.id
        end
        @review.destroy
        #redirect_to reviews_path
        redirect_to :controller => 'books', :action => 'show', :id => @review.book.id, :removed_review => @review.book.title
    end

    private
    def review_params
        params.require(:review).permit(:text, :spoiler, :created_at, :updated_at, :book_id, :profile_id)
    end
end
