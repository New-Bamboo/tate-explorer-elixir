defmodule TateExplorer.Repo.Migrations.CreateArtworks do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE artworks (
      id serial,
      accession_number text,
      artist_id integer,
      title text,
      date text,
      credits text,
      year date,
      dimensions text,
      width text,
      height text,
      depth text,
      units text,
      inscription text,
      thumbnail_url text,
      url text
    );
    """
  end

  def down do
    """
    DROP TABLE artworks;
    """
  end
end
