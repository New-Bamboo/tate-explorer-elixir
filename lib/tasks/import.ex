defmodule Mix.Tasks.Import do
  use Mix.Task

  @shortdoc "Import artists from csv."

  @moduledoc """
  Import artists from a csv file.
  The file needs to be placed in data/ AFTER being converted to unix line endings.
  File name has to be: artist_data.csv
  """
  def run(_) do
    TateExplorer.Repo.start_link
    Progress.header("Starting to import artists ")
    file = "data/artist_data.csv"
    stream = File.stream!(file) |> Stream.drop(1) # remove headers
    Enum.map_reduce stream, 0, fn(line, acc) ->
      msg = "Imported " <> to_string(acc) <> " artists"
      Progress.info(msg, acc)
      item = TateExplorer.Artist.import_from_csv_string(line)
      { item, acc + 1}
    end
    Progress.finish
  end
end
