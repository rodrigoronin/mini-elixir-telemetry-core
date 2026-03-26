defmodule ElixirMiniCore.Repo do
  use Ecto.Repo,
    otp_app: :elixir_mini_core,
    adapter: Ecto.Adapters.SQLite3
end
