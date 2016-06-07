defmodule MoviesApi.MovieController do
  use MoviesApi.Web, :controller

  alias MoviesApi.Movie

  plug :scrub_params, "movie" when action in [:create, :update]

  def index(conn, _params) do
    movies = Repo.all(Movie)
    render(conn, "index.json", movies: movies)
  end

  def create(conn, %{"movie" => movie_params}) do
    changeset = Movie.changeset(%Movie{}, movie_params)

    case Repo.insert(changeset) do
      {:ok, movie} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", movie_path(conn, :show, movie))
        |> render("show.json", movie: movie)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(MoviesApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    movie = Repo.get!(Movie, id)
    render(conn, "show.json", movie: movie)
  end

  def update(conn, %{"id" => id, "movie" => movie_params}) do
    movie = Repo.get!(Movie, id)
    changeset = Movie.changeset(movie, movie_params)

    case Repo.update(changeset) do
      {:ok, movie} ->
        render(conn, "show.json", movie: movie)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(MoviesApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    movie = Repo.get!(Movie, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(movie)

    send_resp(conn, :no_content, "")
  end
end
