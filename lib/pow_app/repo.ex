defmodule PowApp.Repo do
  use Ecto.Repo,
    otp_app: :pow_app,
    adapter: Ecto.Adapters.Postgres
end
