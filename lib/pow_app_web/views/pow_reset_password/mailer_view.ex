defmodule PowAppWeb.PowResetPassword.MailerView do
  use PowAppWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
