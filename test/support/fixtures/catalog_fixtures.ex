defmodule SatelliteApi.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SatelliteApi.Catalog` context.
  """

  @doc """
  Generate a tle.
  """
  def tle_fixture(attrs \\ %{}) do
    {:ok, tle} =
      attrs
      |> Enum.into(%{
        apoapsis: "some apoapsis",
        arg_of_pericenter: "some arg_of_pericenter",
        bstar: "some bstar",
        ccsds_omm_vers: "some ccsds_omm_vers",
        center_name: "some center_name",
        classification_type: "some classification_type",
        comment: "some comment",
        country_code: "some country_code",
        creation_date: "some creation_date",
        decay_date: "some decay_date",
        eccentricity: "some eccentricity",
        element_set_no: "some element_set_no",
        ephemeris_type: "some ephemeris_type",
        epoch: "some epoch",
        file: "some file",
        gp_id: "some gp_id",
        inclination: "some inclination",
        launch_date: "some launch_date",
        mean_anomaly: "some mean_anomaly",
        mean_element_theory: "some mean_element_theory",
        mean_motion: "some mean_motion",
        mean_motion_ddot: "some mean_motion_ddot",
        mean_motion_dot: "some mean_motion_dot",
        norad_cat_id: "some norad_cat_id",
        object_id: "some object_id",
        object_name: "some object_name",
        object_type: "some object_type",
        originator: "some originator",
        periapsis: "some periapsis",
        period: "some period",
        ra_of_asc_node: "some ra_of_asc_node",
        rcs_size: "some rcs_size",
        ref_frame: "some ref_frame",
        rev_at_epoch: "some rev_at_epoch",
        semimajor_axis: "some semimajor_axis",
        site: "some site",
        time_system: "some time_system",
        tle_line0: "some tle_line0",
        tle_line1: "some tle_line1",
        tle_line2: "some tle_line2"
      })
      |> SatelliteApi.Catalog.create_tle()

    tle
  end

  @doc """
  Generate a satellite.
  """
  def satellite_fixture(attrs \\ %{}) do
    {:ok, satellite} =
      attrs
      |> Enum.into(%{
        norad_cat_id: "some norad_cat_id"
      })
      |> SatelliteApi.Catalog.create_satellite()

    satellite
  end
end
