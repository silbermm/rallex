defmodule Rallex.Mixfile do
  use Mix.Project

  def project do
    [app: :rallex,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :httpoison],
     mod: {Rallex, []}]
  end

  defp deps do
    [
      {:httpoison, "~> 0.9.0"},
      {:poison, "~> 2.0"},
      {:mix_test_watch, "~> 0.2", only: [:dev, :test]},
      {:dialyxir, "~> 0.3.5", only: [:dev, :test]}
    ]
  end
end
