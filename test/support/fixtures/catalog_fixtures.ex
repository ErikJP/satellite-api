defmodule App.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Catalog` context.
  """

  @doc """
  Generate a satellite.
  """
  def satellite_fixture(attrs \\ %{}) do
    {:ok, satellite} =
      attrs
      |> Enum.into(%{

      })
      |> App.Catalog.create_satellite()

    satellite
  end
end
