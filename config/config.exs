# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :geo_task_tracker,
  ecto_repos: [GeoTaskTracker.Repo]

# Configures the endpoint
config :geo_task_tracker, GeoTaskTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MNckzG+RCx+PwS92X0Ycc6B/BXIHfWawaHlZKEIRSwLsn7W6fG/ZfgUZNJZC/o2h",
  render_errors: [view: GeoTaskTrackerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GeoTaskTracker.PubSub,
  live_view: [signing_salt: "2ZATNjcC"]

config :geo_task_tracker, GeoTaskTracker.Repo, types: GeoTaskTracker.PostgresTypes

config :geo_postgis,
  json_library: Jason

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
