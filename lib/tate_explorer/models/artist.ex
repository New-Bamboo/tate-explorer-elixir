defmodule TateExplorer.Artist do
  use Ecto.Model

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
      year_of_birth: Enum.at(data, 4) |> datetime_from_year,
      year_of_death: Enum.at(data, 5) |> datetime_from_year,
      place_of_birth: Enum.at(data, 6),
      place_of_death: Enum.at(data, 7),
      url: Enum.at(data, 8)
    )
    Repo.create(artist)
  end

  defp datetime_from_year(year_string) do
    year_integer = binary_to_integer(year_string)
    Ecto.DateTime[year: year_integer, month: 1, day: 1, hour: 0, min: 0, sec: 0]
  end

end
