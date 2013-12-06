defmodule TateExplorer.ArtistQueries do
  import Ecto.Query

  alias TateExplorer.Repo
  alias TateExplorer.Artist

  def all [ limit: limit, offset: offset ] do
    query = from artist in Artist,
            select: artist,
            order_by: artist.name
    Repo.all(from q in query, preload: :artworks, limit: limit, offset: offset)
  end
end
