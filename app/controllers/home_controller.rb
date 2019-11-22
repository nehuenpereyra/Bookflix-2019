class HomeController < ApplicationController
  def index
    @books = Book.all
    @noticias = News.limit(3)
    @profiles = Profile.all
  end
end
