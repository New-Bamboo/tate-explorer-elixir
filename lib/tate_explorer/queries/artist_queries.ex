defmodule TateExplorer.ArtistQueries do
  import Ecto.Query

  alias TateExplorer.Repo
  alias TateExplorer.Artist

  def all(limit // 50) do
    query = from artist in Artist,
            select: artist,
            order_by: artist.name
    Repo.all(from q in query, limit: limit)
  end
end
