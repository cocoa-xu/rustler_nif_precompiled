defmodule MyNIF.NIF do
  @moduledoc false
  use Rustler,
    otp_app: :rustler_nif_precompiled,
    crate: :mynif_nif,
    path: "./native/mynif_nif",
    mode: :release

  version = Mix.Project.config()[:version]
  {:ok, target} = RustlerPrecompiled.target()

  @triplets [
    "aarch64-unknown-linux-gnu",
    "aarch64-apple-darwin",
  ]
  if Enum.any?(@triplets, &String.ends_with?(target, &1)) do
    use RustlerPrecompiled,
      otp_app: :rustler_nif_precompiled,
      crate: "mynif_nif",
      base_url: "https://github.com/cocoa-xu/oh-windows/releases/download/nif-v#{version}",
      force_build: System.get_env("NIF_BUILD") in ["1", "true"],
      version: version,
      nif_versions: ["2.15"],
      targets: @triplets
  end

  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
