defmodule Mix.Tasks.ImportArtworks do
  use Mix.Task

  @shortdoc "Import artworks from csv."

  @moduledoc """
  Import artworks from a csv file.
  The file needs to be placed in data/ AFTER being converted to unix line endings.
  File name has to be: artwork_data.csv
  """
  def run(_) do
    TateExplorer.Repo.start_link
    Progress.header("Starting to import artworks ")
    file = "data/artwork_Data.csv"
    stream = File.stream!(file) |> Stream.drop(1) # remove headers
    Enum.map_reduce stream, 0, fn(line, acc) ->
      msg = "Imported " <> to_string(acc) <> " artworks"
      Progress.info(msg, acc)
      item = TateExplorer.Artwork.import_from_csv_string(line)
      { item, acc + 1}
    end
    Progress.finish
  end
end
