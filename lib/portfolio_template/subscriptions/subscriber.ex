defmodule PortfolioTemplate.Subscriptions.Subscriber do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscribers" do
    field :email, :string
    field :verified, :boolean, default: false
    field :unsubscribed, :boolean, default: false
    field :verification_token, :string
    field :verification_sent_at, :utc_datetime
    field :verified_at, :utc_datetime
    field :unsubscribe_token, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(subscriber, attrs) do
    subscriber
    |> cast(attrs, [
      :email,
      :verified,
      :unsubscribed,
      :verification_token,
      :verification_sent_at,
      :verified_at,
      :unsubscribe_token
    ])
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must be a valid email")
    |> unique_constraint(:email)
    |> unique_constraint(:verification_token)
    |> unique_constraint(:unsubscribe_token)
  end

  @doc """
  Generates verification and unsubscribe tokens for a new subscriber
  """
  def generate_tokens(changeset) do
    verification_token = :crypto.strong_rand_bytes(32) |> Base.url_encode64(padding: false)
    unsubscribe_token = :crypto.strong_rand_bytes(32) |> Base.url_encode64(padding: false)

    changeset
    |> put_change(:verification_token, verification_token)
    |> put_change(:unsubscribe_token, unsubscribe_token)
    |> put_change(:verification_sent_at, DateTime.utc_now() |> DateTime.truncate(:second))
  end
end
