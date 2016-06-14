defmodule MoviesApi.Movie do
  use MoviesApi.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "movies" do
    field :name, :string
    field :watched, :boolean, default: false

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w(watched)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
