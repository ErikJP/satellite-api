defmodule SatelliteApi.Catalog.Satellite do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "satellites" do
    field :norad_cat_id, :string
    field :latest_tle_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(satellite, attrs) do
    satellite
    |> cast(attrs, [:norad_cat_id])
    |> validate_required([:norad_cat_id])
  end
end
