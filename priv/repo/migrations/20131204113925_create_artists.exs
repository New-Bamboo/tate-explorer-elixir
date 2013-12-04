defmodule TateExplorer.Repo.Migrations.CreateArtists do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE artists (
      id serial,
      name text,
      gender text, -- TODO: change this to proper enum when possible
      dates text,
      year_of_birth date,
      year_of_death date,
      place_of_birth text,
      place_of_death text,
      url text
    );
    """
  end

  def down do
    """
    DROP TABLE artists;
    """
  end
end
