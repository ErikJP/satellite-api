defmodule SatelliteApi.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias SatelliteApi.Repo

  alias SatelliteApi.Catalog.Tle

  @doc """
  Returns the list of tles.

  ## Examples

      iex> list_tles()
      [%Tle{}, ...]

  """
  def list_tles do
    Repo.all(Tle)
  end

  @doc """
  Gets a single tle.

  Raises `Ecto.NoResultsError` if the Tle does not exist.

  ## Examples

      iex> get_tle!(123)
      %Tle{}

      iex> get_tle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tle!(id), do: Repo.get!(Tle, id)

  @doc """
  Creates a tle.

  ## Examples

      iex> create_tle(%{field: value})
      {:ok, %Tle{}}

      iex> create_tle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tle(attrs \\ %{}) do
    %Tle{}
    |> Tle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tle.

  ## Examples

      iex> update_tle(tle, %{field: new_value})
      {:ok, %Tle{}}

      iex> update_tle(tle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tle(%Tle{} = tle, attrs) do
    tle
    |> Tle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tle.

  ## Examples

      iex> delete_tle(tle)
      {:ok, %Tle{}}

      iex> delete_tle(tle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tle(%Tle{} = tle) do
    Repo.delete(tle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tle changes.

  ## Examples

      iex> change_tle(tle)
      %Ecto.Changeset{data: %Tle{}}

  """
  def change_tle(%Tle{} = tle, attrs \\ %{}) do
    Tle.changeset(tle, attrs)
  end

  alias SatelliteApi.Catalog.Satellite

  @doc """
  Returns the list of satellites.

  ## Examples

      iex> list_satellites()
      [%Satellite{}, ...]

  """
  def list_satellites do
    Repo.all(Satellite)
  end

  @doc """
  Gets a single satellite.

  Raises `Ecto.NoResultsError` if the Satellite does not exist.

  ## Examples

      iex> get_satellite!(123)
      %Satellite{}

      iex> get_satellite!(456)
      ** (Ecto.NoResultsError)

  """
  def get_satellite!(norad_cat_id), do: Repo.get!(Satellite, norad_cat_id)

  @doc """
  Creates a satellite.

  ## Examples

      iex> create_satellite(%{field: value})
      {:ok, %Satellite{}}

      iex> create_satellite(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_satellite(attrs \\ %{}) do
    %Satellite{}
    |> Satellite.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a satellite.

  ## Examples

      iex> update_satellite(satellite, %{field: new_value})
      {:ok, %Satellite{}}

      iex> update_satellite(satellite, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_satellite(%Satellite{} = satellite, attrs) do
    satellite
    |> Satellite.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a satellite.

  ## Examples

      iex> delete_satellite(satellite)
      {:ok, %Satellite{}}

      iex> delete_satellite(satellite)
      {:error, %Ecto.Changeset{}}

  """
  def delete_satellite(%Satellite{} = satellite) do
    Repo.delete(satellite)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking satellite changes.

  ## Examples

      iex> change_satellite(satellite)
      %Ecto.Changeset{data: %Satellite{}}

  """
  def change_satellite(%Satellite{} = satellite, attrs \\ %{}) do
    Satellite.changeset(satellite, attrs)
  end

  @doc """
  Returns the list of latest_tles.

  ## Examples

      iex> list_latest_tles()
      [%LatestTle{}, ...]

  """
  def list_latest_tles do
    satellites = Repo.all(Satellite)
    Enum.map(satellites, fn(satellite) -> Repo.get!(Tle, satellite.latest_tle_id) end)
  end

  @doc """
  Gets a single latest_tle.

  Raises `Ecto.NoResultsError` if the LatestTle does not exist.

  ## Examples

      iex> get_latest_tle!(123)
      %LatestTle{}

      iex> get_latest_tle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_latest_tle!(norad_cat_id) do
    satellite = Repo.get!(Satellite, norad_cat_id)
    Repo.get!(Tle, satellite.latest_tle_id)
  end
end
