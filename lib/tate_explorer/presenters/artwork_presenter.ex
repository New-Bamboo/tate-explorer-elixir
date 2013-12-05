defmodule TateExplorer.ArtworkPresenter do
  import Conversions

  def wrap_list(list) do
    Enum.map list, &new/1
  end

  def new(artwork) do
    [
      id: artwork.id,
      title: artwork.title,
      accession_number: artwork.accession_number,
      date: artwork.date,
      credits: artwork.credits,
      year: artwork.year |> year_from_datetime,
      dimensions: artwork.dimensions,
      width: artwork.width,
      height: artwork.height,
      depth: artwork.depth,
      units: artwork.units,
      inscription: artwork.inscription,
      thumbnail_url: artwork.thumbnail_url,
      url: artwork.url
    ]
  end

end
