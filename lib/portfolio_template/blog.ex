defmodule PortfolioTemplate.Blog do
  import Ecto.Query, warn: false
  alias PortfolioTemplate.Repo
  alias PortfolioTemplate.Blog.Post

  def list_published_posts do
    Post
    |> where([p], not is_nil(p.published_at))
    |> where([p], p.published_at <= ^DateTime.utc_now())
    |> order_by([p], desc: p.published_at)
    |> Repo.all()
  end

  def list_all_posts do
    Post
    |> order_by([p], desc: :inserted_at)
    |> Repo.all()
  end

  def get_post!(id), do: Repo.get!(Post, id)

  def get_post_by_slug(slug) do
    Post
    |> where([p], p.slug == ^slug)
    |> where([p], not is_nil(p.published_at))
    |> where([p], p.published_at <= ^DateTime.utc_now())
    |> Repo.one()
  end

  def get_post_by_slug!(slug) do
    Post
    |> where([p], p.slug == ^slug)
    |> Repo.one!()
  end

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  def render_markdown(content) when is_binary(content) do
    case Earmark.as_html(content) do
      {:ok, html, _} -> html
      {:error, _html, _errors} -> content
    end
  end

  def render_markdown(_), do: ""
end
