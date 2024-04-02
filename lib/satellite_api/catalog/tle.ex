defmodule SatelliteApi.Catalog.Tle do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tles" do
    field :tle_line0, :string
    field :eccentricity, :string
    field :time_system, :string
    field :comment, :string
    field :periapsis, :string
    field :ra_of_asc_node, :string
    field :site, :string
    field :rev_at_epoch, :string
    field :rcs_size, :string
    field :epoch, :string
    field :ephemeris_type, :string
    field :arg_of_pericenter, :string
    field :mean_element_theory, :string
    field :bstar, :string
    field :tle_line2, :string
    field :apoapsis, :string
    field :mean_anomaly, :string
    field :ccsds_omm_vers, :string
    field :object_name, :string
    field :period, :string
    field :tle_line1, :string
    field :inclination, :string
    field :decay_date, :string
    field :object_type, :string
    field :center_name, :string
    field :originator, :string
    field :launch_date, :string
    field :ref_frame, :string
    field :mean_motion_ddot, :string
    field :object_id, :string
    field :country_code, :string
    field :creation_date, :string
    field :classification_type, :string
    field :mean_motion, :string
    field :file, :string
    field :element_set_no, :string
    field :norad_cat_id, :string
    field :mean_motion_dot, :string
    field :semimajor_axis, :string
    field :gp_id, :string

    timestamps()
  end

  @doc false
  def changeset(tle, attrs) do
    tle
    |> cast(attrs, [:ccsds_omm_vers, :comment, :creation_date, :originator, :object_name, :object_id, :center_name, :ref_frame, :time_system, :mean_element_theory, :epoch, :mean_motion, :eccentricity, :inclination, :ra_of_asc_node, :arg_of_pericenter, :mean_anomaly, :ephemeris_type, :classification_type, :norad_cat_id, :element_set_no, :rev_at_epoch, :bstar, :mean_motion_dot, :mean_motion_ddot, :semimajor_axis, :period, :apoapsis, :periapsis, :object_type, :rcs_size, :country_code, :launch_date, :site, :decay_date, :file, :gp_id, :tle_line0, :tle_line1, :tle_line2])
    |> validate_required([:ccsds_omm_vers, :comment, :creation_date, :originator, :object_name, :object_id, :center_name, :ref_frame, :time_system, :mean_element_theory, :epoch, :mean_motion, :eccentricity, :inclination, :ra_of_asc_node, :arg_of_pericenter, :mean_anomaly, :ephemeris_type, :classification_type, :norad_cat_id, :element_set_no, :rev_at_epoch, :bstar, :mean_motion_dot, :mean_motion_ddot, :semimajor_axis, :period, :apoapsis, :periapsis, :object_type, :rcs_size, :country_code, :launch_date, :site, :decay_date, :file, :gp_id, :tle_line0, :tle_line1, :tle_line2])
  end
end
