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
  def handle_info({:new_event, sensor_id, status}, socket) do
    updated = socket.assigns.telemetry
    |> Enum.reject(fn {id, _} -> id == sensor_id end)
    |> Enum.concat([{sensor_id, status}])

  {:noreply, assign(socket, telemetry: updated)}
  end
end
