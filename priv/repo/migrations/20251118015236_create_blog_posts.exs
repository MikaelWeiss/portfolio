defmodule PortfolioTemplate.Repo.Migrations.CreateBlogPosts do
  use Ecto.Migration

  def change do
    create table(:blog_posts) do
      add :title, :string
      add :slug, :string
      add :content, :text
      add :excerpt, :text
      add :cover_image, :string
      add :meta_description, :text
      add :tags, {:array, :string}
      add :published_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:blog_posts, [:slug])
  end
end
