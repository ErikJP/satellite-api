defmodule SatelliteApi.Repo.Migrations.CreateSatellites do
  use Ecto.Migration

  def change do
    create table(:satellites, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :norad_cat_id, :string
      add :latest_tle_id, references(:tles, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:satellites, [:latest_tle_id])
  end
end
