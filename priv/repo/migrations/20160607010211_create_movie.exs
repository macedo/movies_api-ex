defmodule MoviesApi.Repo.Migrations.CreateMovie do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :original_name, :string
      add :name, :string

      timestamps
    end

  end
end
