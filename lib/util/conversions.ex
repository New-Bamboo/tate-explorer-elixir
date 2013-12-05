defmodule Conversions do
  def datetime_from_year_string(""), do: nil
  def datetime_from_year_string(year_string) do
    year_integer = binary_to_integer(year_string)
    Ecto.DateTime[year: year_integer, month: 1, day: 1, hour: 0, min: 0, sec: 0]
  end

  def string_id_to_integer(""), do: nil
  def string_id_to_integer(string_id) do
    binary_to_integer(string_id)
  end

  def year_from_datetime(year), do: extract_year(year)

  defp extract_year(nil), do: nil
  defp extract_year({ year, _month, _day }), do: year
  defp extract_year(ecto_datetime), do: ecto_datetime.year
end
