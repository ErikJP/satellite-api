defmodule SatelliteApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SatelliteApiWeb.Telemetry,
      # Start the Ecto repository
      SatelliteApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SatelliteApi.PubSub},
      # Start Finch
      {Finch, name: SatelliteApi.Finch},
      # Start the Endpoint (http/https)
      SatelliteApiWeb.Endpoint
      # Start a worker by calling: SatelliteApi.Worker.start_link(arg)
      # {SatelliteApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SatelliteApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SatelliteApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
