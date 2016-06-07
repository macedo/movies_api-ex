defmodule MoviesApi.MovieTest do
  use MoviesApi.ModelCase

  alias MoviesApi.Movie

  @valid_attrs %{name: "some content", original_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Movie.changeset(%Movie{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Movie.changeset(%Movie{}, @invalid_attrs)
    refute changeset.valid?
  end
end
