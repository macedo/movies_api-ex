defmodule MoviesApi.Repo.Migrations.CreateMovie do
  use Ecto.Migration

  def change do
    create table(:movies, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :watched, :boolean, default: false

      timestamps
    end
  end
end
