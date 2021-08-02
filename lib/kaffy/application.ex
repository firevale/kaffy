defmodule Kaffy2.Application do
  @moduledoc false

  use Application

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [
      Kaffy.Cache.Client
    ]

    opts = [strategy: :one_for_one, name: Kaffy2.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
