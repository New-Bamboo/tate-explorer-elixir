defmodule TateExplorer.ArtistPresenter do
  alias TateExplorer.Repo
  alias TateExplorer.ArtworkPresenter
  import Conversions

  def wrap_list(list) do
    Enum.map list, &new/1
  end

  def new(artist) do
    [
      id: artist.id,
      name: artist.name,
      gender: artist.gender,
      dates: artist.dates,
      year_of_birth: artist.year_of_birth |> year_from_datetime,
      year_of_death: artist.year_of_death |> year_from_datetime,
      place_of_birth: artist.place_of_birth,
      place_of_death: artist.place_of_death,
      url: artist.url,
      artworks: artworks_for(artist, artist.artworks.loaded?)
    ]
  end

  defp artworks_for(artist, loaded) do
    do_artworks_for(artist, loaded) |> ArtworkPresenter.wrap_list
  end

  defp do_artworks_for(artist, true) do
    artist.artworks
  end
  defp do_artworks_for(artist, false) do
    Repo.all(artist.artworks)
  end
end
