class MoviesController < ApplicationController
  def index
  	
  end

  def new
  	@movie = Movie.new
  	@genres = Genre.all
  end

  def create   
      
  	Movie.create!(params[:movie])
    params[:genres].each do |g|
      GenresMovie.create!(:genre_id => g.to_i, :movie_id => Movie.last.id)
    end
    redirect_to movies_path
  end

  def show
  	@movie = Movie.find(params[:id])
  end
end
