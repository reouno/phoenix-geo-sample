defmodule GeoSampleWeb.PostView do
  use GeoSampleWeb, :view
  alias GeoSampleWeb.PostView

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    {lat, lon} = post.location.coordinates
    %{id: post.id,
      username: post.username,
      content: post.content,
      latitude: lat,
      longitude: lon}
  end
end
