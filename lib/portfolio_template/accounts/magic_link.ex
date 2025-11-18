defmodule PortfolioTemplate.Accounts.MagicLink do
  use Ecto.Schema
  import Ecto.Changeset

  schema "magic_links" do
    field :token, :string
    field :expires_at, :utc_datetime
    field :used_at, :utc_datetime

    belongs_to :user, PortfolioTemplate.Accounts.User

    timestamps(type: :utc_datetime)
  end

  def changeset(magic_link, attrs) do
    magic_link
    |> cast(attrs, [:token, :user_id, :expires_at, :used_at])
    |> validate_required([:token, :user_id, :expires_at])
    |> unique_constraint(:token)
  end

  def generate_token do
    :crypto.strong_rand_bytes(32) |> Base.url_encode64(padding: false)
  end

  def expired?(%__MODULE__{expires_at: expires_at}) do
    DateTime.compare(DateTime.utc_now(), expires_at) == :gt
  end

  def used?(%__MODULE__{used_at: nil}), do: false
  def used?(%__MODULE__{used_at: _}), do: true
end
