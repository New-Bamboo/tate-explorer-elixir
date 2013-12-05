defmodule ApplicationRouter do
  use Dynamo.Router

  alias TateExplorer.ArtistQueries
  alias TateExplorer.ArtistPresenter
  alias TateExplorer.Cache

  filter JSON.Dynamo.Filter

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  # It is common to break your Dynamo into many
  # routers, forwarding the requests between them:
  # forward "/posts", to: PostsRouter

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "index.html"
  end

  get "/artists" do
    conn.resp 200, get_artists
  end

  defp get_artists do
    result = Cache.get("artists")
    do_get_artists(result)
  end

  defp do_get_artists(:undefined) do
    artists = ArtistQueries.all |> ArtistPresenter.wrap_list
    { :ok, json } = JSON.encode(artists)
    Cache.store("artists", json)
    json
  end

  defp do_get_artists(data), do: data

end
