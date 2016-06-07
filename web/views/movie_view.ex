defmodule MoviesApi.MovieView do
  use MoviesApi.Web, :view

  attributes [:id, :name, :original_name]

  def render("index.json", %{movies: movies}) do
    %{data: render_many(movies, MoviesApi.MovieView, "movie.json")}
  end

  def render("show.json", %{movie: movie}) do
    %{data: render_one(movie, MoviesApi.MovieView, "movie.json")}
  end

  def render("movie.json", %{movie: movie}) do
    %{id: movie.id,
      original_name: movie.original_name,
      name: movie.name}
  end
end
