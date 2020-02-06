defmodule SimpleSaasWeb.PowResetPassword.MailerView do
  use SimpleSaasWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
