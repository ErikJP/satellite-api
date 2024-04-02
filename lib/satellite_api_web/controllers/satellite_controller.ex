defmodule SatelliteApiWeb.SatelliteController do
  use SatelliteApiWeb, :controller

  alias SatelliteApi.Catalog
  alias SatelliteApi.Catalog.Satellite

  action_fallback SatelliteApiWeb.FallbackController

  def index(conn, _params) do
    satellites = Catalog.list_satellites()
    render(conn, :index, satellites: satellites)
  end

  def create(conn, %{"satellite" => satellite_params}) do
    with {:ok, %Satellite{} = satellite} <- Catalog.create_satellite(satellite_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/satellites/#{satellite}")
      |> render(:show, satellite: satellite)
    end
  end

  def show(conn, %{"id" => id}) do
    satellite = Catalog.get_satellite!(id)
    render(conn, :show, satellite: satellite)
  end

  def update(conn, %{"id" => id, "satellite" => satellite_params}) do
    satellite = Catalog.get_satellite!(id)

    with {:ok, %Satellite{} = satellite} <- Catalog.update_satellite(satellite, satellite_params) do
      render(conn, :show, satellite: satellite)
    end
  end

  def delete(conn, %{"id" => id}) do
    satellite = Catalog.get_satellite!(id)

    with {:ok, %Satellite{}} <- Catalog.delete_satellite(satellite) do
      send_resp(conn, :no_content, "")
    end
  end
end
