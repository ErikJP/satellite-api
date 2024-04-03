defmodule AppWeb.SatelliteJSON do
  alias App.Catalog.Satellite

  @doc """
  Renders a list of satellites.
  """
  def index(%{satellites: satellites}) do
    %{data: for(satellite <- satellites, do: data(satellite))}
  end

  @doc """
  Renders a single satellite.
  """
  def show(%{satellite: satellite}) do
    %{data: data(satellite)}
  end

  defp data(%Satellite{} = satellite) do
    %{
      id: satellite.id,
      ccsds_omm_vers: satellite.ccsds_omm_vers,
      comment: satellite.comment,
      creation_date: satellite.creation_date,
      originator: satellite.originator,
      object_name: satellite.object_name,
      object_id: satellite.object_id,
      center_name: satellite.center_name,
      ref_frame: satellite.ref_frame,
      time_system: satellite.time_system,
      mean_element_theory: satellite.mean_element_theory,
      epoch: satellite.epoch,
      mean_motion: satellite.mean_motion,
      eccentricity: satellite.eccentricity,
      inclination: satellite.inclination,
      ra_of_asc_node: satellite.ra_of_asc_node,
      arg_of_pericenter: satellite.arg_of_pericenter,
      mean_anomaly: satellite.mean_anomaly,
      ephemeris_type: satellite.ephemeris_type,
      classification_type: satellite.classification_type,
      norad_cat_id: satellite.norad_cat_id,
      element_set_no: satellite.element_set_no,
      rev_at_epoch: satellite.rev_at_epoch,
      bstar: satellite.bstar,
      mean_motion_dot: satellite.mean_motion_dot,
      mean_motion_ddot: satellite.mean_motion_ddot,
      semimajor_axis: satellite.semimajor_axis,
      period: satellite.period,
      apoapsis: satellite.apoapsis,
      periapsis: satellite.periapsis,
      object_type: satellite.object_type,
      rcs_size: satellite.rcs_size,
      country_code: satellite.country_code,
      launch_date: satellite.launch_date,
      site: satellite.site,
      decay_date: satellite.decay_date,
      file: satellite.file,
      gp_id: satellite.gp_id,
      tle_line0: satellite.tle_line0,
      tle_line1: satellite.tle_line1,
      tle_line2: satellite.tle_line2
    }
  end
end
