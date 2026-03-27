defmodule ElixirMiniCoreWeb.DashboardLive do
  use ElixirMiniCoreWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(ElixirMiniCore.PubSub, "telemetry")
    end

    data = ElixirMiniCore.TelemetryServer.get_state()

    {:ok, assign(socket, telemetry: data)}
  end

  @impl true
  def handle_info({:new_event, _sensor_id, _status}, socket) do
    # data = ElixirMiniCore.TelemetryServer.get_state()
    data = :ets.tab2list(:telemetry_cache)

    {:noreply, assign(socket, telemetry: data)}
  end
end
