defmodule SimpleSaas.Repo do
  use Ecto.Repo,
    otp_app: :simple_saas,
    adapter: Ecto.Adapters.Postgres
end
