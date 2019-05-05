defmodule FiQL.MixProject do

  @github_url "https://github.com/ertgl/fiql"

  @version "0.1.1"

  use Mix.Project

  def project() do
    [
      app: :fiql,
      name: "FiQL",
      source_url: @github_url,
      version: @version,
      description: __MODULE__.description(),
      package: __MODULE__.package(),
      docs: __MODULE__.docs(),
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
    ]
  end

  def description() do
    """
    The Feed Item Query Language, implemented in Elixir.
    https://tools.ietf.org/html/draft-nottingham-atompub-fiql-00
    """
  end

  def package() do
		[
			name: :fiql,
			files: [
				"src",
				"lib",
				"mix.exs",
				"README.md",
				"LICENSE.txt",
			],
			maintainers: [
				"Ertugrul Keremoglu <ertugkeremoglu@gmail.com>",
			],
			licenses: [
				"MIT",
			],
			links: %{
				"GitHub" => @github_url,
			},
		]
  end

  def docs() do
		[
			name: "FiQL",
			source_ref: "v#{@version}",
			source_url: @github_url,
			main: "FiQL",
		]
	end

  # Run "mix help compile.app" to learn about applications.
  def application() do
    [
      extra_applications: [
        :logger,
      ],
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps() do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
    ]
  end

end
