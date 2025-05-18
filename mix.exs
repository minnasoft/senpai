defmodule Senpai.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      preferred_cli_env: [
        "test.watch": :test
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps/ folder.
  defp deps do
    [
      # Required to run "mix format" on ~H/.heex files from the umbrella root
      # TODO bump on release to {:phoenix_live_view, ">= 0.0.0"},
      {:phoenix_live_view, ">= 0.0.0", override: true},
      {:excellent_migrations, "~> 0.1", only: [:dev, :test], runtime: false},
      # mix credo
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      # mix format
      {:styler, "~> 1.4", only: [:dev, :test], runtime: false},
      # mix dialyzer --plt then mix dialyzer
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.18", only: [:dev], runtime: false},
      {:mix_test_watch, "~> 1.0", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.13", only: [:dev, :test], runtime: false},
      {:mimic, "~> 1.10", only: :test}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  #
  # Aliases listed here are available only for this project
  # and cannot be accessed from applications inside the apps/ folder.
  defp aliases do
    [
      setup: ["cmd mix setup"]
    ]
  end
end
