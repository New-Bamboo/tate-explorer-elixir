defmodule TateExplorer.Mixfile do
  use Mix.Project

  def project do
    [ app: :tate_explorer,
      version: "0.0.1",
      build_per_environment: true,
      dynamos: [TateExplorer.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { TateExplorer, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :elixir_csv, github: "baldmountain/elixir_csv" },
      { :postgrex, github: "ericmj/postgrex" },
      { :ecto, github: "elixir-lang/ecto"},
      { :json,   github: "cblage/elixir-json"},
      { :dynamo, "~> 0.1.0-dev", github: "elixir-lang/dynamo" } ]
  end
end
