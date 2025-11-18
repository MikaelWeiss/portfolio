defmodule PortfolioTemplate.Repo.Migrations.CreateSubscribers do
  use Ecto.Migration

  def change do
    create table(:subscribers) do
      add :email, :string, null: false
      add :verified, :boolean, default: false, null: false
      add :unsubscribed, :boolean, default: false, null: false
      add :verification_token, :string
      add :verification_sent_at, :utc_datetime
      add :verified_at, :utc_datetime
      add :unsubscribe_token, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:subscribers, [:email])
    create unique_index(:subscribers, [:verification_token])
    create unique_index(:subscribers, [:unsubscribe_token])
    create index(:subscribers, [:verified])
  end
end
