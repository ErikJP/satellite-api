defmodule App.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Catalog.Satellite

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
  def get_satellite!(id), do: Repo.get!(Satellite, id)

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
end
