defmodule TateExplorer.ArtistPresenter do
  def wrap_list(list) do
    Enum.map list, &new/1
  end

  def new(artist) do
    [
      id: artist.id,
      name: artist.name,
      gender: artist.gender,
      dates: artist.dates,
      year_of_birth: artist.year_of_birth |> extract_year,
      year_of_death: artist.year_of_death |> extract_year,
      place_of_birth: artist.place_of_birth,
      place_of_death: artist.place_of_death,
      url: artist.url
    ]
  end

  defp extract_year(nil), do: nil
  defp extract_year({ year, _month, _day }), do: year
  defp extract_year(ecto_datetime), do: ecto_datetime.year
end
