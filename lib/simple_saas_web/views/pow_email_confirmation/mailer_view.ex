defmodule SimpleSaasWeb.PowEmailConfirmation.MailerView do
  use SimpleSaasWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
