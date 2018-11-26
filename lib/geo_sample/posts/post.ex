defmodule GeoSample.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :content, :string
    field :username, :string
    field :location, Geo.Point

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:username, :content])
    |> validate_required([:username, :content])
  end
end
