class MoviesController < ApplicationController
  def index
  	
  end

  def new
  	@movie = Movie.new
  	@genres = Genre.all
  end

  def create
    debugger
  	Movie.create!(params[:movie])
    GenresMovie.create!(:genre_id => params[:genres], :movie_id => Movie.last.id)
    redirect_to movies_path
  end

  def show
  	@movie = Movie.find(params[:id])
  end
end
