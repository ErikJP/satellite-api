defmodule SatelliteApiWeb.TleController do
  use SatelliteApiWeb, :controller

  alias SatelliteApi.Catalog
  alias SatelliteApi.Catalog.Tle

  action_fallback SatelliteApiWeb.FallbackController

  @satellite_api_uri_base "http://localhost:4000"
  @satellites_api "/api/satellites"

  def index(conn, _params) do
    tles = Catalog.list_tles()
    render(conn, :index, tles: tles)
  end

  def create(conn, %{"tle" => tle_params}) do
    with {:ok, %Tle{} = tle} <- Catalog.create_tle(tle_params) do
      {:ok, latest_tle_id} = Map.fetch(tle, :id)
      {:ok, norad_cat_id} = Map.fetch(tle, :norad_cat_id)
      HTTPoison.patch(
        "#{@satellite_api_uri_base}#{@satellites_api}/#{norad_cat_id}",
        "{\"satellite\": {\"latest_tle_id\": \"#{latest_tle_id}\"}}",
        [{"Content-Type", "application/json"}]
      )
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/tles/#{tle}")
      |> render(:show, tle: tle)
    end
  end

  def show(conn, %{"id" => id}) do
    tle = Catalog.get_tle!(id)
    render(conn, :show, tle: tle)
  end

  def update(conn, %{"id" => id, "tle" => tle_params}) do
    tle = Catalog.get_tle!(id)

    with {:ok, %Tle{} = tle} <- Catalog.update_tle(tle, tle_params) do
      render(conn, :show, tle: tle)
    end
  end

  def delete(conn, %{"id" => id}) do
    tle = Catalog.get_tle!(id)

    with {:ok, %Tle{}} <- Catalog.delete_tle(tle) do
      send_resp(conn, :no_content, "")
    end
  end
end
