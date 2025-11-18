defmodule PortfolioTemplate.Repo.Migrations.CreateMagicLinks do
  use Ecto.Migration

  def change do
    create table(:magic_links) do
      add :token, :string, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :expires_at, :utc_datetime, null: false
      add :used_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:magic_links, [:token])
    create index(:magic_links, [:user_id])
  end
end
