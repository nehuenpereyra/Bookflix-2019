class HomeController < ApplicationController
  def index
    @books = Book.all
    @noticias = News.limit(3)
  end
end
