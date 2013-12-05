defmodule Conversions do

  def datetime_from_year_string(""), do: nil
  def datetime_from_year_string(year_string) do
    year_integer = binary_to_integer(year_string)
    Ecto.DateTime[year: year_integer, month: 1, day: 1, hour: 0, min: 0, sec: 0]
  end

end
