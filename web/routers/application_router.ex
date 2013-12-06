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
    query_options = Paginator.build_query_options(
      conn.params[:page] |> Conversions.string_id_to_integer,
      conn.params[:per_page] |> Conversions.string_id_to_integer
    )
    conn.resp 200, get_artists(query_options)
  end

  defp get_artists(query_options) do
    [ limit: limit_value, offset: offset_value ] = query_options
    result = Cache.get("artists-#{limit_value}-#{offset_value}")
    do_get_artists(result, query_options)
  end

  defp do_get_artists(:undefined, query_options) do
    [ limit: limit_value, offset: offset_value ] = query_options
    artists = ArtistQueries.all(query_options) |> ArtistPresenter.wrap_list
    { :ok, json } = JSON.encode(artists)
    Cache.store("artists-#{limit_value}-#{offset_value}", json)
    json
  end
  defp do_get_artists(data, _), do: data

end
