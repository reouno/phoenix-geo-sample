defmodule GeoSample.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :username, :string
      add :content, :string
      add :location, :geometry

      timestamps()
    end

  end
end
