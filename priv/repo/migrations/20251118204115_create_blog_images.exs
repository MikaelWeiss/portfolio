defmodule PortfolioTemplate.Repo.Migrations.CreateBlogImages do
  use Ecto.Migration

  def change do
    create table(:blog_images) do
      add :blog_post_id, references(:blog_posts, on_delete: :delete_all), null: false
      add :filename, :string, null: false
      add :original_filename, :string, null: false
      add :content_type, :string
      add :size, :integer
      add :alt_text, :string

      timestamps(type: :utc_datetime)
    end

    create index(:blog_images, [:blog_post_id])
  end
end
