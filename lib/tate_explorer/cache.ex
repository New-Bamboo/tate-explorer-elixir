defmodule TateExplorer.Cache do
  def store(key, data) do
    client |> Exredis.query ["SET", key, data]
  end

  def get(key) do
    client |> Exredis.query ["GET", key]
  end

  def client do
    Process.whereis(:redis_client)
  end

  def start_link do
    { :ok, client } = Exredis.start_link
    Process.register(client, :redis_client)
    { :ok, client }
  end
end
