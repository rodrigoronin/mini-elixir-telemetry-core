defmodule ElixirMiniCore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirMiniCoreWeb.Telemetry,
      ElixirMiniCore.Repo,
      {Ecto.Migrator,
       repos: Application.fetch_env!(:elixir_mini_core, :ecto_repos), skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:elixir_mini_core, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirMiniCore.PubSub},
      ElixirMiniCore.TelemetryServer,
      ElixirMiniCore.TelemetryPersistor,
      # Start a worker by calling: ElixirMiniCore.Worker.start_link(arg)
      # {ElixirMiniCore.Worker, arg},
      # Start to serve requests, typically the last entry
      ElixirMiniCoreWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirMiniCore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirMiniCoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") == nil
  end
end
