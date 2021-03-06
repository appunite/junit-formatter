defmodule Formatter.Mixfile do
  use Mix.Project

  @version "2.2.0"

  def project do
    [
      app: :junit_formatter,
      version: @version,
      elixir: "~> 1.4",
      deps: deps(),
      package: package(),
      consolidate_protocols: Mix.env() != :test,
      description: description(),
      name: "JUnit Formatter",
      test_coverage: [tool: ExCoveralls],
      docs: [
        extras: [
          "README.md": [title: "Overview"],
          "CHANGELOG.md": [title: "Changelog"]
        ],
        main: "readme",
        source_ref: "v#{@version}",
        source_url: "https://github.com/victorolinasc/junit-formatter"
      ]
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false},
      {:excoveralls, "~> 0.8", only: :test},
      {:exjsx, "~> 4.0", only: :test, override: true},
      {:credo, "~> 0.9.0-rc6", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"],
      maintainers: ["Victor Nascimento"],
      licenses: ["Apache 2.0"],
      links: %{
        "Github" => "https://github.com/victorolinasc/junit-formatter",
        "docs" => "http://hexdocs.pm/junit_formatter/"
      }
    ]
  end

  defp description do
    """
    An ExUnit.Formatter that produces an XML report of the tests run in the project _build dir.
    It is a good fit with Jenkins test reporting plugin, for example.
    """
  end
end
