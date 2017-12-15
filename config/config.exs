# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :outfitter_api,
  ecto_repos: [OutfitterApi.Repo]

# Configures the endpoint
config :outfitter_api, OutfitterApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gicxZNbUtCu4T6OEvny21G4XQbrKHhe75kzhogxO7pGUg35KFJSyEkDLvuFRdnP5",
  render_errors: [view: OutfitterApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: OutfitterApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
