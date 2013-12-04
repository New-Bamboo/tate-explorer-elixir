defmodule ItemTest do
  use TateExplorer.RepoTestCase, async: false
  alias TateExplorer.Artist

  test "it validates presence of name" do
    assert Artist.validate(Artist.Entity[]) == [name: "can't be blank"]
  end

  test "it imports from a csv string" do
    csv_data = """
    2756,"Abbott, Berenice",Female,1898–1991,1898,1991,"Springfield, United States","Monson, United States",http://www.tate.org.uk/art/artists/berenice-abbott-2756
    """
    artist = Artist.import_from_csv_string(csv_data)
    assert artist.id == 2756
    assert artist.name == "Abbott, Berenice"
    assert artist.gender == "Female"
    assert artist.dates == "1898–1991"
    assert artist.year_of_birth.year == 1898
    assert artist.year_of_death.year == 1991
    assert artist.place_of_birth == "Springfield, United States"
    assert artist.place_of_death == "Monson, United States"
    assert artist.url == "http://www.tate.org.uk/art/artists/berenice-abbott-2756"
  end

end
