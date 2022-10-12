defmodule MssqlEcto.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mssql_ecto,
      version: "1.2.0",
      description: "Ecto Adapter for Microsoft SQL Server. Using Mssqlex.",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      test_paths: ["integration/mssql", "test"],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "test.integration": :test,
        "test.unit": :test,
        coveralls: :test,
        "coveralls.travis": :test
      ],
      name: "MssqlEcto",
      source_url: "https://github.com/findmypast-oss/mssql_ecto",
      docs: [main: "readme", extras: ["README.md"]]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:mssqlex_v3, git: "https://github.com/xueenda/mssqlex_v3.git"},
      {:ecto, "~> 3.7.2"},
      {:ex_doc, "~> 0.15", only: :dev, runtime: false},
      {:excoveralls, "~> 0.6", only: :test},
      {:inch_ex, "~> 0.5", only: :docs}
    ]
  end

  defp package do
    [
      name: :mssql_ecto,
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Steven Blowers", "Jae Bach Hardie"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/findmypast-oss/mssql_ecto"}
    ]
  end
end
