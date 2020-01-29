defmodule PowAppWeb.PageController do
  use PowAppWeb, :controller

  # plug :put_layout, "home_page.html"

  def index(conn, _params) do
    render(conn, "index.html", layout: {PowAppWeb.LayoutView, "landing_page.html"})
  end
end
