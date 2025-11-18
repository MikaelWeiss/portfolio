defmodule PortfolioTemplateWeb.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller
  alias PortfolioTemplate.Accounts

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Accounts.get_user(user_id)

    if user do
      assign(conn, :current_user, user)
    else
      conn
      |> put_flash(:error, "You must be logged in to access this page.")
      |> redirect(to: "/admin/login")
      |> halt()
    end
  end
end
