defmodule PortfolioTemplate.Repo.Migrations.CreateAuthTokens do
  use Ecto.Migration

  def change do
    create table(:auth_tokens) do
      add :token, :string, null: false
      add :email, :string, null: false
      add :expires_at, :utc_datetime, null: false
      add :used_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:auth_tokens, [:token])
    create index(:auth_tokens, [:email])
    create index(:auth_tokens, [:expires_at])
  end
end
