# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :glitchr,
  ecto_repos: [Glitchr.Repo]

# Configures the endpoint
config :glitchr, Glitchr.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ues/8849CWMPGPyo9V01LIeEqcP7NncZJPh17sb+YKmZsAtso+4cGo3FXapmEChV",
  render_errors: [view: Glitchr.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Glitchr.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
