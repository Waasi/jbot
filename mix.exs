defmodule Jbot.Mixfile do
  use Mix.Project

  def project do
    [app: :jbot,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :slack],
     mod: {Jbot, []}]
  end

  defp deps do
    [{:slack, "~> 0.9.3"}, {:jirex, "~> 0.0.1"}]
  end
end
