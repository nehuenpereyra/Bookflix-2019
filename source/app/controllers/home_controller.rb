class HomeController < ApplicationController
  
  def index
    @books = Book.all
    @noticias = News.limit(3)
    @profiles = Profile.all
    @books_suggested = books_suggested()
  end

  private

  def books_suggested
    books = Book.all
    readings = Reading.all.select { |element| element.profile_id == cookies[:current_profile_id].to_i }
    actual_books = books.select { |book| book.parts.any? { |part| readings.any?{ |reading| reading.part_id == part.id} }}
    genres_id = actual_books.collect{|book| book.genre_id}
    suggested = books.select { |book| genres_id.any? { |genre_id| genre_id==book.genre_id } && !actual_books.any?{ |actual| actual.id == book.id} }
    return suggested
  end

end
