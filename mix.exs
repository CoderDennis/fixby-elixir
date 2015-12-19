defmodule Fixby.Mixfile do
  use Mix.Project

  def project do
    [app: :fixby,
     version: "0.0.1",
     elixir: "~> 1.1",
     description: "FIXBY comments that raise after a given version of Elixir.",
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  defp package do
    [
      licenses: ["MIT"],
      contributors: ["Dennis Palmer"],
      links: %{"GitHub" => "https://github.com/CoderDennis/fixby-elixir"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end
end
