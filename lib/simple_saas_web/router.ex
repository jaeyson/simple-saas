defmodule SimpleSaasWeb.Router do
  use SimpleSaasWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowEmailConfirmation]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :landing_page do
    plug :put_layout, {SimpleSaasWeb.LayoutView, "landing_page.html"}
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  scope "/", SimpleSaasWeb do
    pipe_through [:browser, :protected]

    get "/app", PageController, :app
  end

  scope "/", SimpleSaasWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SimpleSaasWeb do
  #   pipe_through :api
  # end
end
