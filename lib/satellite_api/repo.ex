defmodule SatelliteApi.Repo do
  use Ecto.Repo,
    otp_app: :satellite_api,
    adapter: Ecto.Adapters.Postgres
end
