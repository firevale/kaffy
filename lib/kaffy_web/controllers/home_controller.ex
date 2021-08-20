defmodule KaffyWeb2.HomeController do
  @moduledoc false

  use Phoenix.Controller, namespace: KaffyWeb2

  def index(conn, _params) do
    redirect(conn, to: Kaffy2.Utils.home_page(conn))
  end

  def dashboard(conn, _params) do
    # redirect(conn, to: Kaffy2.Utils.home_page(conn))
    render(conn, "index.html", layout: {KaffyWeb2.LayoutView, "app.html"})
  end
end
