defmodule PortfolioTemplate.Accounts do
  import Ecto.Query
  alias PortfolioTemplate.Repo
  alias PortfolioTemplate.Accounts.{User, MagicLink}

  @allowed_email "campingmikael@icloud.com"

  def allowed_email?(email) do
    String.downcase(email) == @allowed_email
  end

  def find_or_create_user(email) do
    email = String.downcase(email)

    case Repo.get_by(User, email: email) do
      nil ->
        %User{}
        |> User.changeset(%{email: email})
        |> Repo.insert()

      user ->
        {:ok, user}
    end
  end

  def generate_magic_link(user, base_url) do
    token = MagicLink.generate_token()
    expires_at = DateTime.add(DateTime.utc_now(), 10, :minute)

    changeset =
      %MagicLink{}
      |> MagicLink.changeset(%{
        token: token,
        user_id: user.id,
        expires_at: expires_at
      })

    case Repo.insert(changeset) do
      {:ok, magic_link} ->
        url = "#{base_url}/admin/verify?token=#{token}"
        {:ok, url, magic_link}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def verify_magic_link(token) do
    case Repo.get_by(MagicLink, token: token) |> Repo.preload(:user) do
      nil ->
        {:error, :not_found}

      magic_link ->
        cond do
          MagicLink.used?(magic_link) ->
            {:error, :already_used}

          MagicLink.expired?(magic_link) ->
            {:error, :expired}

          true ->
            magic_link
            |> MagicLink.changeset(%{used_at: DateTime.utc_now()})
            |> Repo.update()
            |> case do
              {:ok, magic_link} -> {:ok, magic_link.user}
              error -> error
            end
        end
    end
  end

  def get_user(id) do
    Repo.get(User, id)
  end

  def cleanup_expired_links do
    now = DateTime.utc_now()

    from(ml in MagicLink,
      where: ml.expires_at < ^now
    )
    |> Repo.delete_all()
  end
end
