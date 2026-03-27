defmodule ElixirMiniCore.Telemetry.Node do
  use Ecto.Schema
  import Ecto.Changeset

  schema "nodes" do
    field :sensor_id, :string
    field :status, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(node, attrs) do
    node
    |> cast(attrs, [:sensor_id, :status])
    |> validate_required([:sensor_id, :status])
  end
end
