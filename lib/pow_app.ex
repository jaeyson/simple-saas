defmodule PowApp do
  @moduledoc """
  PowApp keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate query(day, month, year, country, api_key), to: PowApp.Api
end
