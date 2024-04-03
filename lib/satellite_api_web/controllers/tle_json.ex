defmodule SatelliteApiWeb.TleJSON do
  alias SatelliteApi.Catalog.Tle

  @doc """
  Renders a list of tles.
  """
  def index(%{tles: tles}) do
    %{data: for(tle <- tles, do: data(tle))}
  end

  @doc """
  Renders a single tle.
  """
  def show(%{tle: tle}) do
    %{data: data(tle)}
  end

  defp data(%Tle{} = tle) do
    %{
      id: tle.id,
      ccsds_omm_vers: tle.ccsds_omm_vers,
      comment: tle.comment,
      creation_date: tle.creation_date,
      originator: tle.originator,
      object_name: tle.object_name,
      object_id: tle.object_id,
      center_name: tle.center_name,
      ref_frame: tle.ref_frame,
      time_system: tle.time_system,
      mean_element_theory: tle.mean_element_theory,
      epoch: tle.epoch,
      mean_motion: tle.mean_motion,
      eccentricity: tle.eccentricity,
      inclination: tle.inclination,
      ra_of_asc_node: tle.ra_of_asc_node,
      arg_of_pericenter: tle.arg_of_pericenter,
      mean_anomaly: tle.mean_anomaly,
      ephemeris_type: tle.ephemeris_type,
      classification_type: tle.classification_type,
      norad_cat_id: tle.norad_cat_id,
      element_set_no: tle.element_set_no,
      rev_at_epoch: tle.rev_at_epoch,
      bstar: tle.bstar,
      mean_motion_dot: tle.mean_motion_dot,
      mean_motion_ddot: tle.mean_motion_ddot,
      semimajor_axis: tle.semimajor_axis,
      period: tle.period,
      apoapsis: tle.apoapsis,
      periapsis: tle.periapsis,
      object_type: tle.object_type,
      rcs_size: tle.rcs_size,
      country_code: tle.country_code,
      launch_date: tle.launch_date,
      site: tle.site,
      decay_date: tle.decay_date,
      file: tle.file,
      gp_id: tle.gp_id,
      tle_line0: tle.tle_line0,
      tle_line1: tle.tle_line1,
      tle_line2: tle.tle_line2
    }
  end
end
