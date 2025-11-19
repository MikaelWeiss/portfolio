defmodule PortfolioTemplateWeb.Admin.AuthController do
  use PortfolioTemplateWeb, :controller
  require Logger

  alias PortfolioTemplate.Accounts
  alias PortfolioTemplate.{Emails, Mailer}

  def new(conn, _params) do
    render(conn, :new, layout: false)
  end

  def create(conn, %{"email" => email}) when is_binary(email) and byte_size(email) > 0 do
    case Accounts.create_magic_link(email) do
      {:ok, token} ->
        # Send magic link email
        case deliver_magic_link_email(email, token.token) do
          {:ok, _} ->
            conn
            |> put_flash(:info, "Check your email for the login link!")
            |> redirect(to: ~p"/admin/login")

          {:error, reason} ->
            Logger.error("Failed to send magic link email: #{inspect(reason)}")

            conn
            |> put_flash(
              :error,
              "Failed to send login email. Please try again or contact support if the problem persists."
            )
            |> redirect(to: ~p"/admin/login")
        end

      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Unauthorized email address.")
        |> redirect(to: ~p"/admin/login")

      {:error, changeset} ->
        Logger.error("Failed to create magic link: #{inspect(changeset)}")

        conn
        |> put_flash(:error, "An error occurred. Please try again.")
        |> redirect(to: ~p"/admin/login")
    end
  end

  def create(conn, _params) do
    conn
    |> put_flash(:error, "Please provide a valid email address.")
    |> redirect(to: ~p"/admin/login")
  end

  defp deliver_magic_link_email(email, token) do
    try do
      email
      |> Emails.magic_link_email(token)
      |> Mailer.deliver()
    rescue
      e ->
        Logger.error("Exception while sending email: #{inspect(e)}")
        {:error, e}
    end
  end

  def verify(conn, %{"token" => token}) when is_binary(token) and byte_size(token) > 0 do
    case Accounts.verify_magic_link(token) do
      {:ok, _token} ->
        Logger.info("Admin successfully authenticated")

        conn
        |> put_session(:admin_authenticated, true)
        |> put_flash(:info, "Successfully logged in!")
        |> redirect(to: ~p"/admin")

      {:error, :not_found} ->
        Logger.warning("Invalid login token attempted")

        conn
        |> put_flash(:error, "Invalid login link.")
        |> redirect(to: ~p"/admin/login")

      {:error, :expired} ->
        Logger.info("Expired login token attempted")

        conn
        |> put_flash(:error, "Login link has expired. Please request a new one.")
        |> redirect(to: ~p"/admin/login")

      {:error, :already_used} ->
        Logger.info("Already-used login token attempted")

        conn
        |> put_flash(:error, "Login link has already been used. Please request a new one.")
        |> redirect(to: ~p"/admin/login")

      {:error, reason} ->
        Logger.error("Unexpected error verifying magic link: #{inspect(reason)}")

        conn
        |> put_flash(:error, "An error occurred. Please try again.")
        |> redirect(to: ~p"/admin/login")
    end
  end

  def verify(conn, _params) do
    conn
    |> put_flash(:error, "Invalid login link.")
    |> redirect(to: ~p"/admin/login")
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:admin_authenticated)
    |> put_flash(:info, "Successfully logged out.")
    |> redirect(to: ~p"/")
  end
end
