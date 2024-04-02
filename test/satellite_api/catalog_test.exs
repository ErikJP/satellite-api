defmodule SatelliteApi.CatalogTest do
  use SatelliteApi.DataCase

  alias SatelliteApi.Catalog

  describe "tles" do
    alias SatelliteApi.Catalog.Tle

    import SatelliteApi.CatalogFixtures

    @invalid_attrs %{gp_id: nil, semimajor_axis: nil, mean_motion_dot: nil, norad_cat_id: nil, element_set_no: nil, file: nil, mean_motion: nil, classification_type: nil, creation_date: nil, country_code: nil, object_id: nil, mean_motion_ddot: nil, ref_frame: nil, launch_date: nil, originator: nil, center_name: nil, object_type: nil, decay_date: nil, inclination: nil, tle_line1: nil, period: nil, object_name: nil, ccsds_omm_vers: nil, mean_anomaly: nil, apoapsis: nil, tle_line2: nil, bstar: nil, mean_element_theory: nil, arg_of_pericenter: nil, ephemeris_type: nil, epoch: nil, rcs_size: nil, rev_at_epoch: nil, site: nil, ra_of_asc_node: nil, periapsis: nil, comment: nil, time_system: nil, eccentricity: nil, tle_line0: nil}

    test "list_tles/0 returns all tles" do
      tle = tle_fixture()
      assert Catalog.list_tles() == [tle]
    end

    test "get_tle!/1 returns the tle with given id" do
      tle = tle_fixture()
      assert Catalog.get_tle!(tle.id) == tle
    end

    test "create_tle/1 with valid data creates a tle" do
      valid_attrs = %{gp_id: "some gp_id", semimajor_axis: "some semimajor_axis", mean_motion_dot: "some mean_motion_dot", norad_cat_id: "some norad_cat_id", element_set_no: "some element_set_no", file: "some file", mean_motion: "some mean_motion", classification_type: "some classification_type", creation_date: "some creation_date", country_code: "some country_code", object_id: "some object_id", mean_motion_ddot: "some mean_motion_ddot", ref_frame: "some ref_frame", launch_date: "some launch_date", originator: "some originator", center_name: "some center_name", object_type: "some object_type", decay_date: "some decay_date", inclination: "some inclination", tle_line1: "some tle_line1", period: "some period", object_name: "some object_name", ccsds_omm_vers: "some ccsds_omm_vers", mean_anomaly: "some mean_anomaly", apoapsis: "some apoapsis", tle_line2: "some tle_line2", bstar: "some bstar", mean_element_theory: "some mean_element_theory", arg_of_pericenter: "some arg_of_pericenter", ephemeris_type: "some ephemeris_type", epoch: "some epoch", rcs_size: "some rcs_size", rev_at_epoch: "some rev_at_epoch", site: "some site", ra_of_asc_node: "some ra_of_asc_node", periapsis: "some periapsis", comment: "some comment", time_system: "some time_system", eccentricity: "some eccentricity", tle_line0: "some tle_line0"}

      assert {:ok, %Tle{} = tle} = Catalog.create_tle(valid_attrs)
      assert tle.tle_line0 == "some tle_line0"
      assert tle.eccentricity == "some eccentricity"
      assert tle.time_system == "some time_system"
      assert tle.comment == "some comment"
      assert tle.periapsis == "some periapsis"
      assert tle.ra_of_asc_node == "some ra_of_asc_node"
      assert tle.site == "some site"
      assert tle.rev_at_epoch == "some rev_at_epoch"
      assert tle.rcs_size == "some rcs_size"
      assert tle.epoch == "some epoch"
      assert tle.ephemeris_type == "some ephemeris_type"
      assert tle.arg_of_pericenter == "some arg_of_pericenter"
      assert tle.mean_element_theory == "some mean_element_theory"
      assert tle.bstar == "some bstar"
      assert tle.tle_line2 == "some tle_line2"
      assert tle.apoapsis == "some apoapsis"
      assert tle.mean_anomaly == "some mean_anomaly"
      assert tle.ccsds_omm_vers == "some ccsds_omm_vers"
      assert tle.object_name == "some object_name"
      assert tle.period == "some period"
      assert tle.tle_line1 == "some tle_line1"
      assert tle.inclination == "some inclination"
      assert tle.decay_date == "some decay_date"
      assert tle.object_type == "some object_type"
      assert tle.center_name == "some center_name"
      assert tle.originator == "some originator"
      assert tle.launch_date == "some launch_date"
      assert tle.ref_frame == "some ref_frame"
      assert tle.mean_motion_ddot == "some mean_motion_ddot"
      assert tle.object_id == "some object_id"
      assert tle.country_code == "some country_code"
      assert tle.creation_date == "some creation_date"
      assert tle.classification_type == "some classification_type"
      assert tle.mean_motion == "some mean_motion"
      assert tle.file == "some file"
      assert tle.element_set_no == "some element_set_no"
      assert tle.norad_cat_id == "some norad_cat_id"
      assert tle.mean_motion_dot == "some mean_motion_dot"
      assert tle.semimajor_axis == "some semimajor_axis"
      assert tle.gp_id == "some gp_id"
    end

    test "create_tle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_tle(@invalid_attrs)
    end

    test "update_tle/2 with valid data updates the tle" do
      tle = tle_fixture()
      update_attrs = %{gp_id: "some updated gp_id", semimajor_axis: "some updated semimajor_axis", mean_motion_dot: "some updated mean_motion_dot", norad_cat_id: "some updated norad_cat_id", element_set_no: "some updated element_set_no", file: "some updated file", mean_motion: "some updated mean_motion", classification_type: "some updated classification_type", creation_date: "some updated creation_date", country_code: "some updated country_code", object_id: "some updated object_id", mean_motion_ddot: "some updated mean_motion_ddot", ref_frame: "some updated ref_frame", launch_date: "some updated launch_date", originator: "some updated originator", center_name: "some updated center_name", object_type: "some updated object_type", decay_date: "some updated decay_date", inclination: "some updated inclination", tle_line1: "some updated tle_line1", period: "some updated period", object_name: "some updated object_name", ccsds_omm_vers: "some updated ccsds_omm_vers", mean_anomaly: "some updated mean_anomaly", apoapsis: "some updated apoapsis", tle_line2: "some updated tle_line2", bstar: "some updated bstar", mean_element_theory: "some updated mean_element_theory", arg_of_pericenter: "some updated arg_of_pericenter", ephemeris_type: "some updated ephemeris_type", epoch: "some updated epoch", rcs_size: "some updated rcs_size", rev_at_epoch: "some updated rev_at_epoch", site: "some updated site", ra_of_asc_node: "some updated ra_of_asc_node", periapsis: "some updated periapsis", comment: "some updated comment", time_system: "some updated time_system", eccentricity: "some updated eccentricity", tle_line0: "some updated tle_line0"}

      assert {:ok, %Tle{} = tle} = Catalog.update_tle(tle, update_attrs)
      assert tle.tle_line0 == "some updated tle_line0"
      assert tle.eccentricity == "some updated eccentricity"
      assert tle.time_system == "some updated time_system"
      assert tle.comment == "some updated comment"
      assert tle.periapsis == "some updated periapsis"
      assert tle.ra_of_asc_node == "some updated ra_of_asc_node"
      assert tle.site == "some updated site"
      assert tle.rev_at_epoch == "some updated rev_at_epoch"
      assert tle.rcs_size == "some updated rcs_size"
      assert tle.epoch == "some updated epoch"
      assert tle.ephemeris_type == "some updated ephemeris_type"
      assert tle.arg_of_pericenter == "some updated arg_of_pericenter"
      assert tle.mean_element_theory == "some updated mean_element_theory"
      assert tle.bstar == "some updated bstar"
      assert tle.tle_line2 == "some updated tle_line2"
      assert tle.apoapsis == "some updated apoapsis"
      assert tle.mean_anomaly == "some updated mean_anomaly"
      assert tle.ccsds_omm_vers == "some updated ccsds_omm_vers"
      assert tle.object_name == "some updated object_name"
      assert tle.period == "some updated period"
      assert tle.tle_line1 == "some updated tle_line1"
      assert tle.inclination == "some updated inclination"
      assert tle.decay_date == "some updated decay_date"
      assert tle.object_type == "some updated object_type"
      assert tle.center_name == "some updated center_name"
      assert tle.originator == "some updated originator"
      assert tle.launch_date == "some updated launch_date"
      assert tle.ref_frame == "some updated ref_frame"
      assert tle.mean_motion_ddot == "some updated mean_motion_ddot"
      assert tle.object_id == "some updated object_id"
      assert tle.country_code == "some updated country_code"
      assert tle.creation_date == "some updated creation_date"
      assert tle.classification_type == "some updated classification_type"
      assert tle.mean_motion == "some updated mean_motion"
      assert tle.file == "some updated file"
      assert tle.element_set_no == "some updated element_set_no"
      assert tle.norad_cat_id == "some updated norad_cat_id"
      assert tle.mean_motion_dot == "some updated mean_motion_dot"
      assert tle.semimajor_axis == "some updated semimajor_axis"
      assert tle.gp_id == "some updated gp_id"
    end

    test "update_tle/2 with invalid data returns error changeset" do
      tle = tle_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_tle(tle, @invalid_attrs)
      assert tle == Catalog.get_tle!(tle.id)
    end

    test "delete_tle/1 deletes the tle" do
      tle = tle_fixture()
      assert {:ok, %Tle{}} = Catalog.delete_tle(tle)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_tle!(tle.id) end
    end

    test "change_tle/1 returns a tle changeset" do
      tle = tle_fixture()
      assert %Ecto.Changeset{} = Catalog.change_tle(tle)
    end
  end

  describe "satellites" do
    alias SatelliteApi.Catalog.Satellite

    import SatelliteApi.CatalogFixtures

    @invalid_attrs %{norad_cat_id: nil}

    test "list_satellites/0 returns all satellites" do
      satellite = satellite_fixture()
      assert Catalog.list_satellites() == [satellite]
    end

    test "get_satellite!/1 returns the satellite with given id" do
      satellite = satellite_fixture()
      assert Catalog.get_satellite!(satellite.id) == satellite
    end

    test "create_satellite/1 with valid data creates a satellite" do
      valid_attrs = %{norad_cat_id: "some norad_cat_id"}

      assert {:ok, %Satellite{} = satellite} = Catalog.create_satellite(valid_attrs)
      assert satellite.norad_cat_id == "some norad_cat_id"
    end

    test "create_satellite/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_satellite(@invalid_attrs)
    end

    test "update_satellite/2 with valid data updates the satellite" do
      satellite = satellite_fixture()
      update_attrs = %{norad_cat_id: "some updated norad_cat_id"}

      assert {:ok, %Satellite{} = satellite} = Catalog.update_satellite(satellite, update_attrs)
      assert satellite.norad_cat_id == "some updated norad_cat_id"
    end

    test "update_satellite/2 with invalid data returns error changeset" do
      satellite = satellite_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_satellite(satellite, @invalid_attrs)
      assert satellite == Catalog.get_satellite!(satellite.id)
    end

    test "delete_satellite/1 deletes the satellite" do
      satellite = satellite_fixture()
      assert {:ok, %Satellite{}} = Catalog.delete_satellite(satellite)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_satellite!(satellite.id) end
    end

    test "change_satellite/1 returns a satellite changeset" do
      satellite = satellite_fixture()
      assert %Ecto.Changeset{} = Catalog.change_satellite(satellite)
    end
  end
end
