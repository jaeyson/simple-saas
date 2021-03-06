# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :simple_saas,
  ecto_repos: [SimpleSaas.Repo]

config :simple_saas, :pow,
  user: SimpleSaas.Users.User,
  repo: SimpleSaas.Repo,
  web_module: SimpleSaasWeb,
  web_mailer_module: SimpleSaasWeb,
  extensions: [PowEmailConfirmation, PowResetPassword, PowPersistentSession],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: SimpleSaasWeb.Pow.Mailer,
  routes_backend: SimpleSaasWeb.Pow.Routes,
  messages_backend: SimpleSaasWeb.Pow.Messages

config :simple_saas, SimpleSaasWeb.Pow.Mailer,
  adapter: Swoosh.Adapters.Mailgun,
  api_key: System.get_env("MAILGUN_API"),
  domain: System.get_env("MAILGUN_DOMAIN")

# Configures the endpoint
config :simple_saas, SimpleSaasWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rqfKNPgdlKLIhqBYm3CnA9quhj2W9kRp74iqnunkTkXiNcHuHNq7YEOZrAvVRkwC",
  render_errors: [view: SimpleSaasWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SimpleSaas.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
