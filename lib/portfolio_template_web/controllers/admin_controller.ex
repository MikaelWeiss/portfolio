defmodule PortfolioTemplateWeb.AdminController do
  use PortfolioTemplateWeb, :controller
  alias PortfolioTemplate.Blog
  alias PortfolioTemplate.Blog.Post

  def index(conn, _params) do
    posts = Blog.list_all_posts()
    render(conn, :index, posts: posts)
  end

  def new(conn, _params) do
    changeset = Blog.change_post(%Post{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    post_params = parse_tags(post_params)

    case Blog.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Blog post created successfully.")
        |> redirect(to: ~p"/admin/blog/#{post.id}/edit")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    changeset = Blog.change_post(post)
    render(conn, :edit, post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Blog.get_post!(id)
    post_params = parse_tags(post_params)

    case Blog.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Blog post updated successfully.")
        |> redirect(to: ~p"/admin/blog/#{post.id}/edit")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    {:ok, _post} = Blog.delete_post(post)

    conn
    |> put_flash(:info, "Blog post deleted successfully.")
    |> redirect(to: ~p"/admin/blog")
  end

  defp parse_tags(params) do
    case Map.get(params, "tags") do
      nil -> params
      "" -> Map.put(params, "tags", [])
      tags when is_binary(tags) ->
        tag_list =
          tags
          |> String.split(",")
          |> Enum.map(&String.trim/1)
          |> Enum.reject(&(&1 == ""))
        Map.put(params, "tags", tag_list)
      tags when is_list(tags) -> params
    end
  end
end
