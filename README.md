# TateExplorer

Small webapp to browse the Tate Modern Gallery Collection.

Data is available at: <https://github.com/tategallery/collection> in csv format.

Being built with Elixir, Dynamo, Postgresql and Redis.

Assuming all dependencies are met:

    cp .envrc.sample .envrc

Customize `.envrc` with your database connection data.

    source .envrc
    mix deps.get
    make dev_setup
    mix server

Alternatively, your env can be better managed with [Direnv](https://github.com/zimbatm/direnv).

## Running tests

    make test_setup
    MIX_ENV=test mix test

## Converting the original files

Place csv files in `data/` and rename them `artist_data.csv` and `artwork_data.csv`.

The original dataset is in UTF-8 with DOS line endings and some unicode issues, so you need to convert it.

    brew install dos2unix
    dos2unix -n artist_data_original.csv artist_data_unix.csv
    cat artist_data_unix.csv | sed 's/–/-/' > artist_data.csv
    dos2unix -n artwork_data_original.csv artwork_data_unix.csv
    cat artwork_data_unix.csv | sed 's/–/-/' > artwork_data.csv

Resources:

* [Elixir website](http://elixir-lang.org/)
* [Elixir getting started guide](http://elixir-lang.org/getting_started/1.html)
* [Elixir docs](http://elixir-lang.org/docs)
* [Dynamo source code](https://github.com/elixir-lang/dynamo)
* [Dynamo guides](https://github.com/elixir-lang/dynamo#learn-more)
* [Dynamo docs](http://elixir-lang.org/docs/dynamo)
