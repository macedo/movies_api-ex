defmodule MoviesApi.PageController do
  use MoviesApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
