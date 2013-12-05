defmodule ArtistPresenterTest do
  use TateExplorer.RepoTestCase, async: false

  alias TateExplorer.Repo
  alias TateExplorer.Artist
  alias TateExplorer.ArtistPresenter

  test "it wraps an item" do
    artist = Artist.new(
      name: "Claudio Ortolina",
      gender: "male",
      dates: "1984-2084",
      year_of_birth: Ecto.DateTime[year: 1984, month: 6, day: 21, hour: 00, min: 00, sec: 00],
      year_of_death: Ecto.DateTime[year: 2084, month: 6, day: 21, hour: 00, min: 00, sec: 00],
      place_of_birth: "Milano",
      place_of_death: "London",
      url: "http://www.google.com"
    )
    artist = Repo.create(artist)
    presented_artist = ArtistPresenter.new(artist)
    assert presented_artist == [
      id: artist.id,
      name: "Claudio Ortolina",
      gender: "male",
      dates: "1984-2084",
      year_of_birth: 1984,
      year_of_death: 2084,
      place_of_birth: "Milano",
      place_of_death: "London",
      url: "http://www.google.com",
      artworks: []
    ]
  end
end
