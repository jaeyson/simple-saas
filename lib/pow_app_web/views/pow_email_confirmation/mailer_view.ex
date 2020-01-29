defmodule PowAppWeb.PowEmailConfirmation.MailerView do
  use PowAppWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
