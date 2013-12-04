defmodule TateExplorer.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def priv do
    app_dir(:tate_explorer, "priv/repo")
  end

  def url, do: do_url(Mix.env)

  defp do_url(env) when env == :prod do
    "ecto://#{System.get_env("DATABASE_URL")}"
  end
  defp do_url(env) do
    "ecto://#{pg_url}-#{Mix.env}#{pg_options(env)}"
  end

  defp pg_url, do: System.get_env("POSTGRES_URL")

  defp pg_options(:dev), do: nil
  defp pg_options(:test), do: "?size=1&max_overflow=0"
end
