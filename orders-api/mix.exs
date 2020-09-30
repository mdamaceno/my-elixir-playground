defmodule OrderApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :order_api,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:httpoison],
      extra_applications: [:logger, :plug_cowboy, :plug, :poison],
      mod: {OrderApi.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:plug_cowboy, "~> 2.0"},
      {:plug, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.6"}
    ]
  end
end
