defmodule TateExplorer.Artist do
  use Ecto.Model
  import Conversions

  alias TateExplorer.Repo

  validate artist,
    name: present()

  queryable "artists" do
    field :name, :string
    field :gender, :string
    field :dates, :string
    field :year_of_birth, :datetime
    field :year_of_death, :datetime
    field :place_of_birth, :string
    field :place_of_death, :string
    field :url, :string
  end

  def import_from_csv_string(csv_string) do
    data = CSV.parse(csv_string) |> List.flatten
    artist = new(
      id: Enum.at(data, 0) |> binary_to_integer,
      name: Enum.at(data, 1),
      gender: Enum.at(data, 2),
      dates: Enum.at(data, 3),
      year_of_birth: Enum.at(data, 4) |> datetime_from_year_string,
      year_of_death: Enum.at(data, 5) |> datetime_from_year_string,
      place_of_birth: Enum.at(data, 6),
      place_of_death: Enum.at(data, 7),
      url: Enum.at(data, 8)
    )
    Repo.create(artist)
  end
end
