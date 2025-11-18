defmodule PortfolioTemplateWeb.AuthController do
  use PortfolioTemplateWeb, :controller
  alias PortfolioTemplate.Accounts
  alias PortfolioTemplate.Mailer
  import Swoosh.Email

  def index(conn, _params) do
    user_id = Plug.Conn.get_session(conn, :user_id)
    user = user_id && Accounts.get_user(user_id)

    if user do
      redirect(conn, to: ~p"/admin/blog")
    else
      redirect(conn, to: ~p"/admin/login")
    end
  end

  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"email" => email}) do
    email = String.trim(email)

    unless Accounts.allowed_email?(email) do
      conn
      |> put_flash(:error, "Access denied. This email is not authorized.")
      |> redirect(to: ~p"/admin/login")
    else
      case Accounts.find_or_create_user(email) do
        {:ok, user} ->
          base_url = PortfolioTemplateWeb.Endpoint.url()

          case Accounts.generate_magic_link(user, base_url) do
            {:ok, magic_link_url, _magic_link} ->
              send_magic_link_email(user.email, magic_link_url)

              conn
              |> put_flash(:info, "Check your email! We sent you a login link.")
              |> redirect(to: ~p"/admin/login/sent")

            {:error, _changeset} ->
              conn
              |> put_flash(:error, "Something went wrong. Please try again.")
              |> redirect(to: ~p"/admin/login")
          end

        {:error, _changeset} ->
          conn
          |> put_flash(:error, "Invalid email address.")
          |> redirect(to: ~p"/admin/login")
      end
    end
  end

  def sent(conn, _params) do
    render(conn, :sent)
  end

  def verify(conn, %{"token" => token}) do
    case Accounts.verify_magic_link(token) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Welcome! You're now logged in.")
        |> redirect(to: ~p"/admin/blog")

      {:error, :not_found} ->
        conn
        |> put_flash(:error, "Invalid login link.")
        |> redirect(to: ~p"/admin/login")

      {:error, :already_used} ->
        conn
        |> put_flash(:error, "This login link has already been used.")
        |> redirect(to: ~p"/admin/login")

      {:error, :expired} ->
        conn
        |> put_flash(:error, "This login link has expired. Please request a new one.")
        |> redirect(to: ~p"/admin/login")
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> put_flash(:info, "You've been logged out.")
    |> redirect(to: ~p"/")
  end

  defp send_magic_link_email(to_email, magic_link_url) do
    email =
      new()
      |> to(to_email)
      |> from({"Mikael Weiss Portfolio", "noreply@mikaelweiss.fly.dev"})
      |> subject("Your login link")
      |> html_body("""
      <div style="font-family: sans-serif; max-width: 600px; margin: 0 auto;">
        <h2>Login to your portfolio admin</h2>
        <p>Click the button below to log in to your portfolio admin panel:</p>
        <p style="margin: 30px 0;">
          <a href="#{magic_link_url}"
             style="background-color: #4F46E5; color: white; padding: 12px 24px;
                    text-decoration: none; border-radius: 6px; display: inline-block;">
            Log in to Admin
          </a>
        </p>
        <p style="color: #666; font-size: 14px;">
          This link will expire in 10 minutes and can only be used once.
        </p>
        <p style="color: #666; font-size: 14px;">
          If you didn't request this email, you can safely ignore it.
        </p>
      </div>
      """)
      |> text_body("""
      Login to your portfolio admin

      Click the link below to log in:
      #{magic_link_url}

      This link will expire in 10 minutes and can only be used once.

      If you didn't request this email, you can safely ignore it.
      """)

    Mailer.deliver(email)
  end
end
