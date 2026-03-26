defmodule ElixirMiniCore.TelemetryServer do
  use GenServer

  # Public API

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def send_event(sensor_id, status) do
    GenServer.cast(__MODULE__, {:event, sensor_id, status})
  end

  def get_state do
    GenServer.call(__MODULE__, :get_state)
  end

  # Callbacks

  @impl true
  def init(_state) do
    table = :ets.new(:telemetry_cache, [:named_table, :public, read_concurrency: true])

    {:ok, table}
  end

  @impl true
  def handle_cast({:event, sensor_id, status}, state) do
    :ets.insert(:telemetry_cache, {sensor_id, status})

    {:noreply, state}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    data = :ets.tab2list(:telemetry_cache)

    {:reply, data, state}
  end
end
