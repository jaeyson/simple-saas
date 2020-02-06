defmodule SimpleSaasWeb.Pow.Messages do
  use Pow.Phoenix.Messages
  use Pow.Extension.Phoenix.Messages,
   extensions: [PowResetPassword, PowEmailConfirmation]

  import SimpleSaasWeb.Gettext

  def user_not_authenticated(_conn), do: gettext("You need to sign in to see this page.")
  def signed_out(_conn), do: gettext("Signed out successfullly.")
  def signed_in(_conn), do: gettext("Welcome")
  def email_has_been_sent(_conn), do: gettext("An email with reset instructions has been sent to you. Please check your inbox.")
  def invalid_token(_conn), do: gettext("The reset token has expired.")
  def password_has_been_reset(_conn), do: gettext("The password has been updated.")
  def email_has_been_confirmed(_conn), do: gettext("The email address has been confirmed.")
  def email_confirmation_failed(_conn), do: gettext("The email address couldn't be confirmed.")
  def email_confirmation_required(_conn), do: gettext("You'll need to confirm your e-mail before you can sign in. An e-mail confirmation link has been sent to you.")
end

