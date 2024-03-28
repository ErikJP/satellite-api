defmodule App.CatalogTest do
  use App.DataCase

  alias App.Catalog

  describe "satellites" do
    alias App.Catalog.Satellite

    import App.CatalogFixtures

    @invalid_attrs %{}

    test "list_satellites/0 returns all satellites" do
      satellite = satellite_fixture()
      assert Catalog.list_satellites() == [satellite]
    end

    test "get_satellite!/1 returns the satellite with given id" do
      satellite = satellite_fixture()
      assert Catalog.get_satellite!(satellite.id) == satellite
    end

    test "create_satellite/1 with valid data creates a satellite" do
      valid_attrs = %{}

      assert {:ok, %Satellite{} = satellite} = Catalog.create_satellite(valid_attrs)
    end

    test "create_satellite/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_satellite(@invalid_attrs)
    end

    test "update_satellite/2 with valid data updates the satellite" do
      satellite = satellite_fixture()
      update_attrs = %{}

      assert {:ok, %Satellite{} = satellite} = Catalog.update_satellite(satellite, update_attrs)
    end

    test "update_satellite/2 with invalid data returns error changeset" do
      satellite = satellite_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_satellite(satellite, @invalid_attrs)
      assert satellite == Catalog.get_satellite!(satellite.id)
    end

    test "delete_satellite/1 deletes the satellite" do
      satellite = satellite_fixture()
      assert {:ok, %Satellite{}} = Catalog.delete_satellite(satellite)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_satellite!(satellite.id) end
    end

    test "change_satellite/1 returns a satellite changeset" do
      satellite = satellite_fixture()
      assert %Ecto.Changeset{} = Catalog.change_satellite(satellite)
    end
  end
end
