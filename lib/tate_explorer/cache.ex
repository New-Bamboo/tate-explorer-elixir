defmodule TateExplorer.Cache do
  def store(key, data) do
    client |> Exredis.query ["SET", key_with_metadata(key), data]
  end

  def get(key) do
    client |> Exredis.query ["GET", key_with_metadata(key)]
  end

  def client do
    Process.whereis(:redis_client)
  end

  def start_link do
    { :ok, client } = start_redis_server(Mix.env)
    Process.register(client, :redis_client)
    { :ok, client }
  end

  defp key_with_metadata(key) do
    "tate-explorer-#{Mix.env}-#{key}"
  end

  defp start_redis_server(:prod) do
    Exredis.start_link(
      System.env("REDIS_HOST"),
      System.env("REDIS_PORT"),
      System.env("REDIS_DATABASE"),
      System.env("PASSWORD")
    )
  end
  defp start_redis_server(_) do
    Exredis.start_link
  end
end
