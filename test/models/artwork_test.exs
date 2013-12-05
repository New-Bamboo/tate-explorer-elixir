defmodule ArtworkTest do
  use TateExplorer.RepoTestCase, async: false
  alias TateExplorer.Artwork

  test "it has the right validations" do
    assert Artwork.validate(Artwork.Entity[]) == [title: "can't be blank", artist_id: "can't be blank"]
  end

  test "it imports from a csv string" do
    csv_data = """
1035,A00001,"Blake, Robert",38,A Figure Bowing before a Seated Old Man with his Arm Outstretched in Benediction. Verso: Indecipherable Sketch,date not known,Presented by Mrs John Richmond 1922,,support: 394 x 419 mm,394,419,,mm,,http://www.tate.org.uk/art/images/work/A/A00/A00001_8.jpg,http://www.tate.org.uk/art/artworks/blake-a-figure-bowing-before-a-seated-old-man-with-his-arm-outstretched-in-benediction-verso-indecipherable-sketch-a00001
    """
    artwork = Artwork.import_from_csv_string(csv_data)
    assert artwork.id == 1035
    assert artwork.accession_number == "A00001"
    assert artwork.title == "A Figure Bowing before a Seated Old Man with his Arm Outstretched in Benediction. Verso: Indecipherable Sketch"
    assert artwork.date == "date not known"
    assert artwork.credits == "Presented by Mrs John Richmond 1922"
    assert artwork.year == nil
    assert artwork.dimensions == "support: 394 x 419 mm"
    assert artwork.width == "394"
    assert artwork.height == "419"
    assert artwork.depth == ""
    assert artwork.units == "mm"
    assert artwork.inscription == ""
    assert artwork.thumbnail_url == "http://www.tate.org.uk/art/images/work/A/A00/A00001_8.jpg"
    assert artwork.url == "http://www.tate.org.uk/art/artworks/blake-a-figure-bowing-before-a-seated-old-man-with-his-arm-outstretched-in-benediction-verso-indecipherable-sketch-a00001"
  end

end
