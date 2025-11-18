defmodule PortfolioTemplate.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias PortfolioTemplate.Repo
  alias PortfolioTemplate.Blog.{Post, Image}

  @doc """
  Returns the list of all blog posts sorted by last_updated descending.
  """
  def list_posts do
    Repo.all(from p in Post, order_by: [desc: p.last_updated])
  end

  @doc """
  Alias for list_posts/0.
  """
  def list_all_posts, do: list_posts()

  @doc """
  Returns the list of published blog posts sorted by published_at descending.
  """
  def list_published_posts do
    Repo.all(
      from p in Post,
        where: p.published == true,
        order_by: [desc: p.published_at]
    )
  end

  @doc """
  Gets a single post by id.

  Raises `Ecto.NoResultsError` if the Post does not exist.
  """
  def get_post!(id), do: Repo.get!(Post, id) |> Repo.preload(:images)

  @doc """
  Gets a single post by slug.

  Returns `nil` if the Post does not exist.
  """
  def get_post_by_slug(slug) do
    Repo.one(from p in Post, where: p.slug == ^slug, preload: :images)
  end

  @doc """
  Gets a single published post by slug.

  Returns `nil` if the Post does not exist or is not published.
  """
  def get_published_post_by_slug(slug) do
    Repo.one(
      from p in Post,
        where: p.slug == ^slug and p.published == true,
        preload: :images
    )
  end

  @doc """
  Creates a post.
  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.
  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.
  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.
  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  @doc """
  Creates an image associated with a blog post.
  """
  def create_image(attrs \\ %{}) do
    %Image{}
    |> Image.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Deletes an image.
  """
  def delete_image(%Image{} = image) do
    Repo.delete(image)
  end

  @doc """
  Returns the list of images for a post.
  """
  def list_post_images(post_id) do
    Repo.all(from i in Image, where: i.blog_post_id == ^post_id)
  end
end
