defmodule SatelliteApi.Repo.Migrations.CreateTles do
  use Ecto.Migration

  def change do
    create table(:tles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :ccsds_omm_vers, :string
      add :comment, :string
      add :creation_date, :string
      add :originator, :string
      add :object_name, :string
      add :object_id, :string
      add :center_name, :string
      add :ref_frame, :string
      add :time_system, :string
      add :mean_element_theory, :string
      add :epoch, :string
      add :mean_motion, :string
      add :eccentricity, :string
      add :inclination, :string
      add :ra_of_asc_node, :string
      add :arg_of_pericenter, :string
      add :mean_anomaly, :string
      add :ephemeris_type, :string
      add :classification_type, :string
      add :norad_cat_id, :string
      add :element_set_no, :string
      add :rev_at_epoch, :string
      add :bstar, :string
      add :mean_motion_dot, :string
      add :mean_motion_ddot, :string
      add :semimajor_axis, :string
      add :period, :string
      add :apoapsis, :string
      add :periapsis, :string
      add :object_type, :string
      add :rcs_size, :string
      add :country_code, :string
      add :launch_date, :string
      add :site, :string
      add :decay_date, :string
      add :file, :string
      add :gp_id, :string
      add :tle_line0, :string
      add :tle_line1, :string
      add :tle_line2, :string

      timestamps()
    end
  end
end
