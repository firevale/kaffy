defmodule KaffyWeb2.TaskController do
  @moduledoc false

  use Phoenix.Controller, namespace: KaffyWeb2

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
