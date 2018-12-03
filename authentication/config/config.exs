# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :authentication,
  ecto_repos: [Authentication.Repo]

# Configures the endpoint
config :authentication, AuthenticationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2RX/QHXLzoYl9i3JKmX6x4hLVQIEZ6XHfV08yPKfhVnz5WPDElkOKxK8VVo8zrqo",
  render_errors: [view: AuthenticationWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Authentication.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
