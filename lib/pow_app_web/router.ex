defmodule PowAppWeb.Router do
  use PowAppWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowEmailConfirmation, PowResetPassword]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :landing_page do
    plug :put_layout, {PowAppWeb.LayoutView, "landing_page.html"}
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: PowAppWeb.AuthErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated,
      error_handler: PowAppWeb.AuthErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  scope "/", PowAppWeb do
    pipe_through [:browser, :not_authenticated]

    get "/signup", RegistrationController, :new, as: :signup
    post "/signup", RegistrationController, :create, as: :signup
    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
  end

  scope "/", PowAppWeb do
    pipe_through [:browser, :protected]

    delete "/logout", SessionController, :delete, as: :logout
  end

  scope "/", PowAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/pow-app", PowAppLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", PowAppWeb do
  #   pipe_through :api
  # end
end
