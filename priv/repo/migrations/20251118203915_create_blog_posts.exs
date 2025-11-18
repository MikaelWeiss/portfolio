defmodule PortfolioTemplate.Repo.Migrations.CreateBlogPosts do
  use Ecto.Migration

  def change do
    create table(:blog_posts) do
      add :title, :string, null: false
      add :slug, :string, null: false
      add :content, :text, null: false
      add :excerpt, :string
      add :published, :boolean, default: false, null: false
      add :published_at, :utc_datetime
      add :last_updated, :utc_datetime, null: false
      add :cover_image_path, :string
      add :meta_title, :string
      add :meta_description, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:blog_posts, [:slug])
    create index(:blog_posts, [:published])
    create index(:blog_posts, [:published_at])
    create index(:blog_posts, [:last_updated])
  end
end
