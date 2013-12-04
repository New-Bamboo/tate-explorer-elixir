defmodule TateExplorer.Artist do
  use Ecto.Model

  validate artist,
    name: present()

  queryable "artists" do
    field :name, :string
    field :gender, :string
    field :dates, :string
    field :year_of_birth, :datetime
    field :year_of_death, :datetime
    field :place_of_death, :string
    field :url, :string
  end

end
