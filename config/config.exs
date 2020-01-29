# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pow_app,
  ecto_repos: [PowApp.Repo]

config :pow_app, :pow,
  user: PowApp.Users.User,
  repo: PowApp.Repo,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: PowAppWeb.PowMailer,
  web_mailer_module: PowAppWeb,
  web_module: PowAppWeb

# Configures the endpoint
config :pow_app, PowAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZrKBFFL495T2MOZLtmLPb49G9SKZ8IqzAxo7Aj0hAjQtygwcxrQaBjj4FsZiJVn0",
  render_errors: [view: PowAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PowApp.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [ signing_salt: "L5Ws4HxLE+UJrGzJcJoo0lddyzWfIulG" ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
