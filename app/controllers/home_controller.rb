class HomeController < ApplicationController
  def index
    @books = Book.all
    @profiles = Profile.all
  end
end
