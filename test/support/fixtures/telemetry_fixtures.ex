defmodule ElixirMiniCore.TelemetryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirMiniCore.Telemetry` context.
  """

  @doc """
  Generate a node.
  """
  def node_fixture(attrs \\ %{}) do
    {:ok, node} =
      attrs
      |> Enum.into(%{
        sensor_id: "some sensor_id",
        status: "some status"
      })
      |> ElixirMiniCore.Telemetry.create_node()

    node
  end
end
