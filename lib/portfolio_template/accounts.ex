defmodule PortfolioTemplate.Accounts do
  @moduledoc """
  The Accounts context for authentication.
  """

  import Ecto.Query, warn: false
  alias PortfolioTemplate.Repo
  alias PortfolioTemplate.Accounts.AuthToken

  @admin_email "mikael.weiss@weisssolutions.org"

  @doc """
  Creates a new magic link token for the admin user.

  Returns {:ok, token} if the email is the admin email.
  Returns {:error, :unauthorized} if the email is not the admin email.
  """
  def create_magic_link(email) do
    if email == @admin_email do
      auth_token = AuthToken.create_token(email)

      case Repo.insert(auth_token) do
        {:ok, token} -> {:ok, token}
        {:error, changeset} -> {:error, changeset}
      end
    else
      {:error, :unauthorized}
    end
  end

  @doc """
  Verifies a magic link token.

  Returns {:ok, token} if the token is valid and not expired or used.
  Returns {:error, reason} otherwise.
  """
  def verify_magic_link(token_string) do
    case Repo.get_by(AuthToken, token: token_string) do
      nil ->
        {:error, :not_found}

      token ->
        cond do
          AuthToken.used?(token) ->
            {:error, :already_used}

          AuthToken.expired?(token) ->
            {:error, :expired}

          true ->
            # Mark token as used
            token
            |> Ecto.Changeset.change(used_at: DateTime.utc_now() |> DateTime.truncate(:second))
            |> Repo.update()
        end
    end
  end

  @doc """
  Cleans up expired tokens from the database.
  This should be run periodically (e.g., via a scheduled job).
  """
  def cleanup_expired_tokens do
    now = DateTime.utc_now()

    Repo.delete_all(
      from t in AuthToken,
        where: t.expires_at < ^now
    )
  end

  @doc """
  Returns the admin email address.
  """
  def admin_email, do: @admin_email
end
