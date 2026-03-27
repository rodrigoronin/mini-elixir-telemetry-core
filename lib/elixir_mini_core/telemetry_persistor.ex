defmodule ElixirMiniCore.TelemetryPersistor do
  use GenServer

  alias ElixirMiniCore.Telemetry

  @interval 5_000 # 5 seconds

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    schedule_work()
    {:ok, state}
  end

  @impl true
  def handle_info(:persist, state) do
    data = :ets.tab2list(:telemetry_cache)

    Enum.each(data, fn {sensor_id, status} ->
      Telemetry.create_node(%{
        sensor_id: sensor_id,
        status: status
      })
    end)

    schedule_work()
    {:noreply, state}
  end

  defp schedule_work do
    Process.send_after(self(), :persist, @interval)
  end
end
