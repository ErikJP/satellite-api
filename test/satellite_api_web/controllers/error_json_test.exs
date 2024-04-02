defmodule SatelliteApiWeb.ErrorJSONTest do
  use SatelliteApiWeb.ConnCase, async: true

  test "renders 404" do
    assert SatelliteApiWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert SatelliteApiWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
