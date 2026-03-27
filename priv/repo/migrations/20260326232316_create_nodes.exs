defmodule ElixirMiniCore.Repo.Migrations.CreateNodes do
  use Ecto.Migration

  def change do
    create table(:nodes) do
      add :sensor_id, :string
      add :status, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:nodes, [:sensor_id]) # stops duplication
  end
end
