class NewsController < ApplicationController
    
    before_action :authenticate_administrator!, except: [:index], if: :subscriber_signed_in?
    before_action :authenticate_scope!
    
    def new
        @news = News.new
    end

    def create
        @news = News.new(news_params)
        if @news.save
            redirect_to :controller => 'news', :action => 'index', :add_success => @news.title
        else
            render 'new'
        end
    end

    def show
        @news = News.find(params[:id])
    end

    def index
        @news_index = News.all
    end





    def news_home
        @noticias = News.limit(3)  
    end
    




    
    def edit
        @news = News.find(params[:id])
    end

    def update
        @news = News.find(params[:id])
        if @news.update(news_params)
        redirect_to news_index_path
        else
            render 'edit'
        end
    end

    def destroy
        @news = News.find(params[:id])
        @news.destroy
        redirect_to news_index_path, :notice => "La noticia se elimino con exito."
    end

    private
    def news_params
        params.require(:news).permit( :title, :content, :publication_date)
    end
end
