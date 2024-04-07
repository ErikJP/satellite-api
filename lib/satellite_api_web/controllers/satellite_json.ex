defmodule SatelliteApiWeb.SatelliteJSON do
  alias SatelliteApi.Catalog.Satellite

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
      norad_cat_id: satellite.norad_cat_id,
      latest_tle_id: satellite.latest_tle_id
    }
  end
end
