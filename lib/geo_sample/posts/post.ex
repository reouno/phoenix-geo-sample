defmodule GeoSample.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :content, :string
    field :username, :string
    field :location, Geo.Point
    field :latitude, :float, virtual: true
    field :longitude, :float, virtual: true

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:username, :content, :latitude, :longitude])
    |> validate_required([:username, :content])

    |> generate_geo_point
  end

  defp generate_geo_point(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{latitude: lat, longitude: lon}} ->
        put_change(changeset, :location, Geo.WKT.decode("SRID=4326;POINT(#{lat} #{lon})"))
      _ ->
        changeset
    end
  end

end
