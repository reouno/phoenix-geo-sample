defmodule GeoSampleWeb.PageController do
  use GeoSampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
