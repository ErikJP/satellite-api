defmodule SatelliteApiWeb.LatestTleController do
  use SatelliteApiWeb, :controller

  alias SatelliteApi.Catalog

  action_fallback SatelliteApiWeb.FallbackController

  def index(conn, _params) do
    latest_tles = Catalog.list_latest_tles()
    render(conn, :index, latest_tles: latest_tles)
  end

  def show(conn, %{"norad_cat_id" => norad_cat_id}) do
    latest_tle = Catalog.get_latest_tle!(norad_cat_id)
    render(conn, :show, latest_tle: latest_tle)
  end
end
