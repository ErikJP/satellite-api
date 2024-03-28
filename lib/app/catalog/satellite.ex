defmodule App.Catalog.Satellite do
  @moduledoc """
  Module for getting / storing satellite TLEs and relevant data
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "satellites" do
    field :ccsds_omm_vers, :string
    field :comment, :string
    field :creation_date, :string
    field :originator, :string
    field :object_name, :string
    field :object_id, :string
    field :center_name, :string
    field :ref_frame, :string
    field :time_system, :string
    field :mean_element_theory, :string
    field :epoch, :string
    field :mean_motion, :string
    field :eccentricity, :string
    field :inclination, :string
    field :ra_of_asc_node, :string
    field :arg_of_pericenter, :string
    field :mean_anomaly, :string
    field :ephemeris_type, :string
    field :classification_type, :string
    field :norad_cat_id, :string
    field :element_set_no, :string
    field :rev_at_epoch, :string
    field :bstar, :string
    field :mean_motion_dot, :string
    field :mean_motion_ddot, :string
    field :semimajor_axis, :string
    field :period, :string
    field :apoapsis, :string
    field :periapsis, :string
    field :object_type, :string
    field :rcs_size, :string
    field :country_code, :string
    field :launch_date, :string
    field :site, :string
    field :decay_date, :string
    field :file, :string
    field :gp_id, :string
    field :tle_line0, :string
    field :tle_line1, :string
    field :tle_line2, :string
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(satellite, attrs) do
    satellite
    |> cast(
      attrs,
      [
        :ccsds_omm_vers,
        :comment,
        :creation_date,
        :originator,
        :object_name,
        :object_id,
        :center_name,
        :ref_frame,
        :time_system,
        :mean_element_theory,
        :epoch,
        :mean_motion,
        :eccentricity,
        :inclination,
        :ra_of_asc_node,
        :arg_of_pericenter,
        :mean_anomaly,
        :ephemeris_type,
        :classification_type,
        :norad_cat_id,
        :element_set_no,
        :rev_at_epoch,
        :bstar,
        :mean_motion_dot,
        :mean_motion_ddot,
        :semimajor_axis,
        :period,
        :apoapsis,
        :periapsis,
        :object_type,
        :rcs_size,
        :country_code,
        :launch_date,
        :site,
        :decay_date,
        :file,
        :gp_id,
        :tle_line0,
        :tle_line1,
        :tle_line2,
      ]
    )
    |> validate_required(
      [
        :ccsds_omm_vers,
        :comment,
        :creation_date,
        :originator,
        :object_name,
        :object_id,
        :center_name,
        :ref_frame,
        :time_system,
        :mean_element_theory,
        :epoch,
        :mean_motion,
        :eccentricity,
        :inclination,
        :ra_of_asc_node,
        :arg_of_pericenter,
        :mean_anomaly,
        :ephemeris_type,
        :classification_type,
        :norad_cat_id,
        :element_set_no,
        :rev_at_epoch,
        :bstar,
        :mean_motion_dot,
        :mean_motion_ddot,
        :semimajor_axis,
        :period,
        :apoapsis,
        :periapsis,
        :object_type,
        :rcs_size,
        :country_code,
        :launch_date,
        :site,
        :decay_date,
        :file,
        :gp_id,
        :tle_line0,
        :tle_line1,
        :tle_line2,
      ]
    )
  end
end
