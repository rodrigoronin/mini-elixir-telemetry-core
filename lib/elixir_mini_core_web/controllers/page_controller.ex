defmodule ElixirMiniCoreWeb.PageController do
  use ElixirMiniCoreWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
