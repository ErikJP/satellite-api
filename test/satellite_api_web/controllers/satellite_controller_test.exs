defmodule SatelliteApiWeb.SatelliteControllerTest do
  use SatelliteApiWeb.ConnCase

  import SatelliteApi.CatalogFixtures

  alias SatelliteApi.Catalog.Satellite

  @create_attrs %{
    norad_cat_id: "some norad_cat_id",
    latest_tle_id: "some latest_tle_id"
  }
  @update_attrs %{
    norad_cat_id: "some updated norad_cat_id",
    latest_tle_id: "some updated latest_tle_id"
  }
  @invalid_attrs %{norad_cat_id: nil, latest_tle_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all satellites", %{conn: conn} do
      conn = get(conn, ~p"/api/satellites")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create satellite" do
    test "renders satellite when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/satellites", satellite: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/satellites/#{id}")

      assert %{
               "id" => ^id,
               "latest_tle_id" => "some latest_tle_id",
               "norad_cat_id" => "some norad_cat_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/satellites", satellite: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update satellite" do
    setup [:create_satellite]

    test "renders satellite when data is valid", %{conn: conn, satellite: %Satellite{id: id} = satellite} do
      conn = put(conn, ~p"/api/satellites/#{satellite}", satellite: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/satellites/#{id}")

      assert %{
               "id" => ^id,
               "latest_tle_id" => "some updated latest_tle_id",
               "norad_cat_id" => "some updated norad_cat_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, satellite: satellite} do
      conn = put(conn, ~p"/api/satellites/#{satellite}", satellite: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete satellite" do
    setup [:create_satellite]

    test "deletes chosen satellite", %{conn: conn, satellite: satellite} do
      conn = delete(conn, ~p"/api/satellites/#{satellite}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/satellites/#{satellite}")
      end
    end
  end

  defp create_satellite(_) do
    satellite = satellite_fixture()
    %{satellite: satellite}
  end
end
