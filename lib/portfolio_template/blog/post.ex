defmodule PortfolioTemplate.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blog_posts" do
    field :title, :string
    field :slug, :string
    field :content, :string
    field :excerpt, :string
    field :cover_image, :string
    field :meta_description, :string
    field :tags, {:array, :string}
    field :published_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :slug, :content, :excerpt, :cover_image, :meta_description, :tags, :published_at])
    |> validate_required([:title, :slug, :content])
    |> validate_length(:title, min: 1, max: 255)
    |> validate_length(:excerpt, max: 500)
    |> maybe_generate_slug()
    |> unique_constraint(:slug)
  end

  defp maybe_generate_slug(changeset) do
    case get_change(changeset, :slug) do
      nil ->
        case get_change(changeset, :title) do
          nil -> changeset
          title -> put_change(changeset, :slug, slugify(title))
        end
      _slug -> changeset
    end
  end

  defp slugify(string) do
    string
    |> String.downcase()
    |> String.replace(~r/[^\w\s-]/, "")
    |> String.replace(~r/[\s_]+/, "-")
    |> String.trim("-")
  end
end
