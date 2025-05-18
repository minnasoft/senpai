# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  senpai_web: [
    args: ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/senpai_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Oban (background jobs)
config :senpai, Oban,
  engine: Oban.Engines.Basic,
  queues: [default: 10],
  repo: Senpai.Repo

# Configure Mix tasks and generators
config :senpai,
  ecto_repos: [Senpai.Repo]

# Configures the endpoint
config :senpai_web, SenpaiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: SenpaiWeb.ErrorHTML, json: SenpaiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Senpai.PubSub,
  live_view: [signing_salt: "tHKDE727"]

config :senpai_web,
  ecto_repos: [Senpai.Repo],
  generators: [context_app: :senpai, binary_id: true]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.3",
  senpai_web: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),

    # Import environment specific config. This must remain at the bottom
    # of this file so it overrides the configuration defined above.
    cd: Path.expand("../apps/senpai_web/assets", __DIR__)
  ]

import_config "#{config_env()}.exs"
