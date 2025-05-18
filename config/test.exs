import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :senpai, Senpai.Repo,
  username: System.fetch_env!("SENPAI_DB_USER"),
  password: System.fetch_env!("SENPAI_DB_PASSWORD"),
  hostname: System.fetch_env!("SENPAI_DB_HOST"),
  database: "senpai_test",
  port: System.fetch_env!("SENPAI_DB_PORT"),
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :senpai_web, SenpaiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "+m+kvC+gQVZsZgjEWsf8TrgqTb8RrvmXhJaQJWKBzidqKjFg6Ej5opZzf4KhkKtn",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
