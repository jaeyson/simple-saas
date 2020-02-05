defmodule SimpleSaasWeb.PageController do
  use SimpleSaasWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", layout: {SimpleSaasWeb.LayoutView, "landing_page.html"})
  end

  def app(conn, _params) do
    render(conn, "index.html")
  end
end
