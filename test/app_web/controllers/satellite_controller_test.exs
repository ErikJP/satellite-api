defmodule AppWeb.SatelliteControllerTest do
  use AppWeb.ConnCase

  import App.CatalogFixtures

  alias App.Catalog.Satellite

  @create_attrs %{
    object_id: "some object_id",
    arg_of_pericenter: "some arg_of_pericenter",
    rev_at_epoch: "some rev_at_epoch",
    country_code: "some country_code",
    classification_type: "some classification_type",
    norad_cat_id: "some norad_cat_id",
    rcs_size: "some rcs_size",
    comment: "some comment",
    decay_date: "some decay_date",
    element_set_no: "some element_set_no",
    center_name: "some center_name",
    tle_line2: "some tle_line2",
    gp_id: "some gp_id",
    mean_motion: "some mean_motion",
    inclination: "some inclination",
    periapsis: "some periapsis",
    bstar: "some bstar",
    mean_element_theory: "some mean_element_theory",
    apoapsis: "some apoapsis",
    period: "some period",
    originator: "some originator",
    object_type: "some object_type",
    object_name: "some object_name",
    eccentricity: "some eccentricity",
    creation_date: "some creation_date",
    ccsds_omm_vers: "some ccsds_omm_vers",
    time_system: "some time_system",
    mean_anomaly: "some mean_anomaly",
    mean_motion_dot: "some mean_motion_dot",
    epoch: "some epoch",
    launch_date: "some launch_date",
    site: "some site",
    ephemeris_type: "some ephemeris_type",
    ra_of_asc_node: "some ra_of_asc_node",
    tle_line0: "some tle_line0",
    tle_line1: "some tle_line1",
    ref_frame: "some ref_frame",
    file: "some file",
    semimajor_axis: "some semimajor_axis",
    mean_motion_ddot: "some mean_motion_ddot"
  }
  @update_attrs %{
    object_id: "some updated object_id",
    arg_of_pericenter: "some updated arg_of_pericenter",
    rev_at_epoch: "some updated rev_at_epoch",
    country_code: "some updated country_code",
    classification_type: "some updated classification_type",
    norad_cat_id: "some updated norad_cat_id",
    rcs_size: "some updated rcs_size",
    comment: "some updated comment",
    decay_date: "some updated decay_date",
    element_set_no: "some updated element_set_no",
    center_name: "some updated center_name",
    tle_line2: "some updated tle_line2",
    gp_id: "some updated gp_id",
    mean_motion: "some updated mean_motion",
    inclination: "some updated inclination",
    periapsis: "some updated periapsis",
    bstar: "some updated bstar",
    mean_element_theory: "some updated mean_element_theory",
    apoapsis: "some updated apoapsis",
    period: "some updated period",
    originator: "some updated originator",
    object_type: "some updated object_type",
    object_name: "some updated object_name",
    eccentricity: "some updated eccentricity",
    creation_date: "some updated creation_date",
    ccsds_omm_vers: "some updated ccsds_omm_vers",
    time_system: "some updated time_system",
    mean_anomaly: "some updated mean_anomaly",
    mean_motion_dot: "some updated mean_motion_dot",
    epoch: "some updated epoch",
    launch_date: "some updated launch_date",
    site: "some updated site",
    ephemeris_type: "some updated ephemeris_type",
    ra_of_asc_node: "some updated ra_of_asc_node",
    tle_line0: "some updated tle_line0",
    tle_line1: "some updated tle_line1",
    ref_frame: "some updated ref_frame",
    file: "some updated file",
    semimajor_axis: "some updated semimajor_axis",
    mean_motion_ddot: "some updated mean_motion_ddot"
  }
  @invalid_attrs %{mean_motion_ddot: nil, semimajor_axis: nil, file: nil, ref_frame: nil, tle_line1: nil, tle_line0: nil, ra_of_asc_node: nil, ephemeris_type: nil, site: nil, launch_date: nil, epoch: nil, mean_motion_dot: nil, mean_anomaly: nil, time_system: nil, ccsds_omm_vers: nil, creation_date: nil, eccentricity: nil, object_name: nil, object_type: nil, originator: nil, period: nil, apoapsis: nil, mean_element_theory: nil, bstar: nil, periapsis: nil, inclination: nil, mean_motion: nil, gp_id: nil, tle_line2: nil, center_name: nil, element_set_no: nil, decay_date: nil, comment: nil, rcs_size: nil, norad_cat_id: nil, classification_type: nil, country_code: nil, rev_at_epoch: nil, arg_of_pericenter: nil, object_id: nil}

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
               "eccentricity" => "some eccentricity",
               "norad_cat_id" => "some norad_cat_id",
               "mean_motion_dot" => "some mean_motion_dot",
               "rev_at_epoch" => "some rev_at_epoch",
               "rcs_size" => "some rcs_size",
               "element_set_no" => "some element_set_no",
               "ephemeris_type" => "some ephemeris_type",
               "originator" => "some originator",
               "bstar" => "some bstar",
               "semimajor_axis" => "some semimajor_axis",
               "periapsis" => "some periapsis",
               "ref_frame" => "some ref_frame",
               "creation_date" => "some creation_date",
               "gp_id" => "some gp_id",
               "tle_line1" => "some tle_line1",
               "object_name" => "some object_name",
               "file" => "some file",
               "apoapsis" => "some apoapsis",
               "decay_date" => "some decay_date",
               "country_code" => "some country_code",
               "ra_of_asc_node" => "some ra_of_asc_node",
               "comment" => "some comment",
               "classification_type" => "some classification_type",
               "site" => "some site",
               "mean_element_theory" => "some mean_element_theory",
               "tle_line2" => "some tle_line2",
               "launch_date" => "some launch_date",
               "time_system" => "some time_system",
               "ccsds_omm_vers" => "some ccsds_omm_vers",
               "object_id" => "some object_id",
               "tle_line0" => "some tle_line0",
               "arg_of_pericenter" => "some arg_of_pericenter",
               "epoch" => "some epoch",
               "mean_motion_ddot" => "some mean_motion_ddot",
               "center_name" => "some center_name",
               "inclination" => "some inclination",
               "mean_motion" => "some mean_motion",
               "period" => "some period",
               "mean_anomaly" => "some mean_anomaly",
               "object_type" => "some object_type"
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
               "eccentricity" => "some updated eccentricity",
               "norad_cat_id" => "some updated norad_cat_id",
               "mean_motion_dot" => "some updated mean_motion_dot",
               "rev_at_epoch" => "some updated rev_at_epoch",
               "rcs_size" => "some updated rcs_size",
               "element_set_no" => "some updated element_set_no",
               "ephemeris_type" => "some updated ephemeris_type",
               "originator" => "some updated originator",
               "bstar" => "some updated bstar",
               "semimajor_axis" => "some updated semimajor_axis",
               "periapsis" => "some updated periapsis",
               "ref_frame" => "some updated ref_frame",
               "creation_date" => "some updated creation_date",
               "gp_id" => "some updated gp_id",
               "tle_line1" => "some updated tle_line1",
               "object_name" => "some updated object_name",
               "file" => "some updated file",
               "apoapsis" => "some updated apoapsis",
               "decay_date" => "some updated decay_date",
               "country_code" => "some updated country_code",
               "ra_of_asc_node" => "some updated ra_of_asc_node",
               "comment" => "some updated comment",
               "classification_type" => "some updated classification_type",
               "site" => "some updated site",
               "mean_element_theory" => "some updated mean_element_theory",
               "tle_line2" => "some updated tle_line2",
               "launch_date" => "some updated launch_date",
               "time_system" => "some updated time_system",
               "ccsds_omm_vers" => "some updated ccsds_omm_vers",
               "object_id" => "some updated object_id",
               "tle_line0" => "some updated tle_line0",
               "arg_of_pericenter" => "some updated arg_of_pericenter",
               "epoch" => "some updated epoch",
               "mean_motion_ddot" => "some updated mean_motion_ddot",
               "center_name" => "some updated center_name",
               "inclination" => "some updated inclination",
               "mean_motion" => "some updated mean_motion",
               "period" => "some updated period",
               "mean_anomaly" => "some updated mean_anomaly",
               "object_type" => "some updated object_type"
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
