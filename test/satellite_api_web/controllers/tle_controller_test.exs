defmodule SatelliteApiWeb.TleControllerTest do
  use SatelliteApiWeb.ConnCase

  import SatelliteApi.CatalogFixtures

  alias SatelliteApi.Catalog.Tle

  @create_attrs %{
    site: "some site",
    mean_element_theory: "some mean_element_theory",
    object_id: "some object_id",
    comment: "some comment",
    mean_motion_ddot: "some mean_motion_ddot",
    mean_motion: "some mean_motion",
    rcs_size: "some rcs_size",
    tle_line1: "some tle_line1",
    classification_type: "some classification_type",
    apoapsis: "some apoapsis",
    ref_frame: "some ref_frame",
    ra_of_asc_node: "some ra_of_asc_node",
    eccentricity: "some eccentricity",
    center_name: "some center_name",
    norad_cat_id: "some norad_cat_id",
    gp_id: "some gp_id",
    mean_motion_dot: "some mean_motion_dot",
    inclination: "some inclination",
    ccsds_omm_vers: "some ccsds_omm_vers",
    decay_date: "some decay_date",
    epoch: "some epoch",
    tle_line0: "some tle_line0",
    country_code: "some country_code",
    tle_line2: "some tle_line2",
    semimajor_axis: "some semimajor_axis",
    originator: "some originator",
    object_type: "some object_type",
    object_name: "some object_name",
    rev_at_epoch: "some rev_at_epoch",
    creation_date: "some creation_date",
    periapsis: "some periapsis",
    period: "some period",
    arg_of_pericenter: "some arg_of_pericenter",
    time_system: "some time_system",
    file: "some file",
    ephemeris_type: "some ephemeris_type",
    mean_anomaly: "some mean_anomaly",
    element_set_no: "some element_set_no",
    bstar: "some bstar",
    launch_date: "some launch_date"
  }
  @update_attrs %{
    site: "some updated site",
    mean_element_theory: "some updated mean_element_theory",
    object_id: "some updated object_id",
    comment: "some updated comment",
    mean_motion_ddot: "some updated mean_motion_ddot",
    mean_motion: "some updated mean_motion",
    rcs_size: "some updated rcs_size",
    tle_line1: "some updated tle_line1",
    classification_type: "some updated classification_type",
    apoapsis: "some updated apoapsis",
    ref_frame: "some updated ref_frame",
    ra_of_asc_node: "some updated ra_of_asc_node",
    eccentricity: "some updated eccentricity",
    center_name: "some updated center_name",
    norad_cat_id: "some updated norad_cat_id",
    gp_id: "some updated gp_id",
    mean_motion_dot: "some updated mean_motion_dot",
    inclination: "some updated inclination",
    ccsds_omm_vers: "some updated ccsds_omm_vers",
    decay_date: "some updated decay_date",
    epoch: "some updated epoch",
    tle_line0: "some updated tle_line0",
    country_code: "some updated country_code",
    tle_line2: "some updated tle_line2",
    semimajor_axis: "some updated semimajor_axis",
    originator: "some updated originator",
    object_type: "some updated object_type",
    object_name: "some updated object_name",
    rev_at_epoch: "some updated rev_at_epoch",
    creation_date: "some updated creation_date",
    periapsis: "some updated periapsis",
    period: "some updated period",
    arg_of_pericenter: "some updated arg_of_pericenter",
    time_system: "some updated time_system",
    file: "some updated file",
    ephemeris_type: "some updated ephemeris_type",
    mean_anomaly: "some updated mean_anomaly",
    element_set_no: "some updated element_set_no",
    bstar: "some updated bstar",
    launch_date: "some updated launch_date"
  }
  @invalid_attrs %{launch_date: nil, bstar: nil, element_set_no: nil, mean_anomaly: nil, ephemeris_type: nil, file: nil, time_system: nil, arg_of_pericenter: nil, period: nil, periapsis: nil, creation_date: nil, rev_at_epoch: nil, object_name: nil, object_type: nil, originator: nil, semimajor_axis: nil, tle_line2: nil, country_code: nil, tle_line0: nil, epoch: nil, decay_date: nil, ccsds_omm_vers: nil, inclination: nil, mean_motion_dot: nil, gp_id: nil, norad_cat_id: nil, center_name: nil, eccentricity: nil, ra_of_asc_node: nil, ref_frame: nil, apoapsis: nil, classification_type: nil, tle_line1: nil, rcs_size: nil, mean_motion: nil, mean_motion_ddot: nil, comment: nil, object_id: nil, mean_element_theory: nil, site: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tles", %{conn: conn} do
      conn = get(conn, ~p"/api/tles")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tle" do
    test "renders tle when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/tles", tle: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/tles/#{id}")

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
      conn = post(conn, ~p"/api/tles", tle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tle" do
    setup [:create_tle]

    test "renders tle when data is valid", %{conn: conn, tle: %Tle{id: id} = tle} do
      conn = put(conn, ~p"/api/tles/#{tle}", tle: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/tles/#{id}")

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

    test "renders errors when data is invalid", %{conn: conn, tle: tle} do
      conn = put(conn, ~p"/api/tles/#{tle}", tle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tle" do
    setup [:create_tle]

    test "deletes chosen tle", %{conn: conn, tle: tle} do
      conn = delete(conn, ~p"/api/tles/#{tle}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/tles/#{tle}")
      end
    end
  end

  defp create_tle(_) do
    tle = tle_fixture()
    %{tle: tle}
  end
end
