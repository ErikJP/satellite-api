defmodule SatelliteApi.Repo.Migrations.CreateSatellites do
  use Ecto.Migration

  def change do
    create table(:satellites, primary_key: false) do
      add :norad_cat_id, :string, primary_key: true
      add :latest_tle_id, references(:tles, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:satellites, [:latest_tle_id])
  end
end
