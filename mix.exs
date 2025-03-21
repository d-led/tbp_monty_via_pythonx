defmodule TbpMontyViaPythonx.MixProject do
  use Mix.Project

  def project do
    [
      app: :tbp_monty_via_pythonx,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :chumak],
      mod: mod()
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:pythonx, "~> 0.4.0"},
      {:chumak, "~> 1.5"},
      {:jason, "~> 1.4"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp mod() do
    case Mix.env() do
      :test -> []
      _ -> {ElixirStreamingToPythonViaZmq, []}
    end
  end
end
