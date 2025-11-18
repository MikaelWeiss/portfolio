defmodule PortfolioTemplate.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blog_posts" do
    field :title, :string
    field :slug, :string
    field :content, :string
    field :excerpt, :string
    field :published, :boolean, default: false
    field :published_at, :utc_datetime
    field :last_updated, :utc_datetime
    field :cover_image_path, :string
    field :meta_title, :string
    field :meta_description, :string

    has_many :images, PortfolioTemplate.Blog.Image, foreign_key: :blog_post_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [
      :title,
      :slug,
      :content,
      :excerpt,
      :published,
      :published_at,
      :last_updated,
      :cover_image_path,
      :meta_title,
      :meta_description
    ])
    |> validate_required([:title, :content])
    |> maybe_generate_slug()
    |> maybe_set_last_updated()
    |> validate_format(:slug, ~r/^[a-z0-9-]+$/)
    |> unique_constraint(:slug)
    |> maybe_set_published_at()
  end

  defp maybe_generate_slug(changeset) do
    if get_change(changeset, :slug) do
      changeset
    else
      case get_change(changeset, :title) do
        nil ->
          changeset

        title ->
          slug =
            title
            |> String.downcase()
            |> String.replace(~r/[^\w\s-]/, "")
            |> String.replace(~r/\s+/, "-")

          put_change(changeset, :slug, slug)
      end
    end
  end

  defp maybe_set_last_updated(changeset) do
    if get_change(changeset, :last_updated) do
      changeset
    else
      put_change(changeset, :last_updated, DateTime.utc_now() |> DateTime.truncate(:second))
    end
  end

  defp maybe_set_published_at(changeset) do
    cond do
      get_change(changeset, :published) == true && is_nil(get_field(changeset, :published_at)) ->
        put_change(changeset, :published_at, DateTime.utc_now() |> DateTime.truncate(:second))

      get_change(changeset, :published) == false ->
        put_change(changeset, :published_at, nil)

      true ->
        changeset
    end
  end
end
