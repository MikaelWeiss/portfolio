defmodule PortfolioTemplateWeb.Admin.AuthController do
  use PortfolioTemplateWeb, :controller

  alias PortfolioTemplate.Accounts
  alias PortfolioTemplate.{Emails, Mailer}

  def new(conn, _params) do
    render(conn, :new, layout: false)
  end

  def create(conn, %{"email" => email}) do
    case Accounts.create_magic_link(email) do
      {:ok, token} ->
        # Send magic link email
        email
        |> Emails.magic_link_email(token.token)
        |> Mailer.deliver()

        conn
        |> put_flash(:info, "Check your email for the login link!")
        |> redirect(to: ~p"/admin/login")

      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Unauthorized email address.")
        |> redirect(to: ~p"/admin/login")

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "An error occurred. Please try again.")
        |> redirect(to: ~p"/admin/login")
    end
  end

  def verify(conn, %{"token" => token}) do
    case Accounts.verify_magic_link(token) do
      {:ok, _token} ->
        conn
        |> put_session(:admin_authenticated, true)
        |> put_flash(:info, "Successfully logged in!")
        |> redirect(to: ~p"/admin")

      {:error, :not_found} ->
        conn
        |> put_flash(:error, "Invalid login link.")
        |> redirect(to: ~p"/admin/login")

      {:error, :expired} ->
        conn
        |> put_flash(:error, "Login link has expired. Please request a new one.")
        |> redirect(to: ~p"/admin/login")

      {:error, :already_used} ->
        conn
        |> put_flash(:error, "Login link has already been used. Please request a new one.")
        |> redirect(to: ~p"/admin/login")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:admin_authenticated)
    |> put_flash(:info, "Successfully logged out.")
    |> redirect(to: ~p"/")
  end
end
