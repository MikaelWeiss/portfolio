defmodule PortfolioTemplateWeb.PageController do
  use PortfolioTemplateWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home)
  end

  def works(conn, _params) do
    render(conn, :works)
  end

  def about(conn, _params) do
    render(conn, :about)
  end
end
