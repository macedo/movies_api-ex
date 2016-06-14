defmodule MoviesApi.MovieView do
  use MoviesApi.Web, :view

  attributes [:id, :inserted_at, :name, :updated_at, :watched]

  def render("index.json", %{movies: movies}) do
    %{data: render_many(movies, MoviesApi.MovieView, "movie.json")}
  end

  def render("show.json", %{movie: movie}) do
    %{data: render_one(movie, MoviesApi.MovieView, "movie.json")}
  end

  def render("movie.json", %{movie: movie}) do
    %{id: movie.id,
      name: movie.name}
  end
end
