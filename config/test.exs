use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :outfitter_api, OutfitterApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :outfitter_api, OutfitterApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "outfitter_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Use the mock adapter for tesla HTTP clients,
# such as OutfitterApi.Bungie.Client
config :tesla, adapter: :mock
