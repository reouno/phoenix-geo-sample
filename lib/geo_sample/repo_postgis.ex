defmodule GeoSample.RepoPostgis do
  Postgrex.Types.define(GeoSample.PostgresTypes,
    [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
    library: Geo) 
end
