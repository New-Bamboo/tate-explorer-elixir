defmodule TateExplorer.Artwork do
  use Ecto.Model
  import Conversions

  alias TateExplorer.Repo
  alias TateExplorer.Artist

  validate artwork,
    title: present(),
    artist_id: present()

  queryable "artworks" do
    field :title, :string
    field :accession_number, :string
    field :date, :string
    field :credits, :string
    field :year, :datetime
    field :dimensions, :string
    field :width, :string
    field :height, :string
    field :depth, :string
    field :units, :string
    field :inscription, :string
    field :thumbnail_url, :string
    field :url, :string

    belongs_to :artist, Artist
  end

  def import_from_csv_string(csv_string) do
    data = CSV.parse(csv_string) |> List.flatten
    artwork = new(
      id: Enum.at(data, 0) |> binary_to_integer,
      accession_number: Enum.at(data, 1),
      artist_id: Enum.at(data, 3) |> binary_to_integer,
      title: Enum.at(data, 4),
      date: Enum.at(data, 5),
      credits: Enum.at(data, 6),
      year: Enum.at(data, 7) |> datetime_from_year_string,
      dimensions: Enum.at(data, 8),
      width: Enum.at(data, 9),
      height: Enum.at(data, 10),
      depth: Enum.at(data, 11),
      units: Enum.at(data, 12),
      inscription: Enum.at(data, 13),
      thumbnail_url: Enum.at(data, 14),
      url: Enum.at(data, 15)
    )
    Repo.create(artwork)
  end

end
