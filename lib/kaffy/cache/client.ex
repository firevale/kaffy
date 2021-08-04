defmodule Kaffy2.Cache.Client do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: KaffyCache2)
  end

  @impl true
  def init(_) do
    Kaffy2.Cache.Table.create_table()
    {:ok, %{}}
  end

  def add_cache(key, suffix, value, expire_after \\ 600) do
    GenServer.call(KaffyCache, {:add, key, suffix, value, expire_after})
  end

  def get_cache(key, suffix) do
    GenServer.call(KaffyCache, {:get, key, suffix})
  end

  @impl true
  def handle_call({:add, key, suffix, value, expire_after}, _from, state) do
    result = Kaffy2.Cache.Table.add_to_cache(key, suffix, value, expire_after)
    {:reply, result, state}
  end

  @impl true
  def handle_call({:get, key, suffix}, _from, state) do
    result = Kaffy2.Cache.Table.get_from_cache(key, suffix)
    {:reply, result, state}
  end
end
