defmodule PortfolioTemplate.Accounts.AuthToken do
  use Ecto.Schema
  import Ecto.Changeset

  schema "auth_tokens" do
    field :token, :string
    field :email, :string
    field :expires_at, :utc_datetime
    field :used_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(auth_token, attrs) do
    auth_token
    |> cast(attrs, [:token, :email, :expires_at, :used_at])
    |> validate_required([:token, :email, :expires_at])
    |> unique_constraint(:token)
  end

  @doc """
  Creates a new auth token that expires in 5 minutes
  """
  def create_token(email) do
    token = :crypto.strong_rand_bytes(32) |> Base.url_encode64(padding: false)
    expires_at = DateTime.utc_now() |> DateTime.add(5, :minute) |> DateTime.truncate(:second)

    %__MODULE__{
      token: token,
      email: email,
      expires_at: expires_at
    }
  end

  @doc """
  Checks if a token is expired
  """
  def expired?(%__MODULE__{expires_at: expires_at}) do
    DateTime.compare(DateTime.utc_now(), expires_at) == :gt
  end

  @doc """
  Checks if a token has been used
  """
  def used?(%__MODULE__{used_at: nil}), do: false
  def used?(%__MODULE__{used_at: _}), do: true
end
