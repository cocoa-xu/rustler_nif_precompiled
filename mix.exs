defmodule RustlerNIFPrecompiled.MixProject do
  use Mix.Project

  @version "0.1.0"
  def project do
    [
      app: :rustler_nif_precompiled,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.32"},
      {:rustler_precompiled, "~> 0.7"},
    ]
  end
end
