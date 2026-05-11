defmodule Spatio.Mixfile do
  use Mix.Project

  def project do
    [
      app: :spatio_sdk,
      version: "1.0.0",
      elixir: "~> 1.18",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: """
      The REST API that owns every resource in your Spatio workspace: notes, sheets, slides, tasks, calendar events, mail, chat, files, and contacts. SpatioMCP wraps this API; Spatio Desktop reads from it. You can call it directly from your own code.  All requests must be authenticated with a Personal Access Token (&#x60;Authorization: Bearer pat_...&#x60;) or an OAuth 2.1 access token, and use HTTPS.  Official SDKs (MIT, generated from this spec on every release):  - TypeScript: https://github.com/spatio-labs/spatio-ts (&#x60;npm install @spatio/sdk-ts&#x60;) - Python: https://github.com/spatio-labs/spatio-py (&#x60;pip install spatio-sdk&#x60;) - Go: https://github.com/spatio-labs/spatio-go (&#x60;go get github.com/spatio-labs/spatio-go&#x60;)  This specification is generated from the platform-service Go source on every push to &#x60;main&#x60;. The spec, not hand-written documentation, is the source of truth: server stubs and SDKs are generated from it, and any drift between the spec and the running service fails CI. 
      """,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.3.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:tesla, "~> 1.14"},
      {:ex_doc, "~> 0.37.3", only: :dev, runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

   defp package do
      [
        name: "spatio_sdk",
        files: ~w(.formatter.exs config lib mix.exs README* LICENSE*),
      ]
  end
end
