class CreateGenresMovies < ActiveRecord::Migration
  def change
    create_table :genres_movies, :id => false do |t|
      t.integer :movie_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
