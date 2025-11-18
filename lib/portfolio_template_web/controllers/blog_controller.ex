defmodule PortfolioTemplateWeb.BlogController do
  use PortfolioTemplateWeb, :controller

  alias PortfolioTemplate.Blog

  def index(conn, _params) do
    posts = Blog.list_published_posts()
    render(conn, :index, posts: posts)
  end

  def show(conn, %{"slug" => slug}) do
    case Blog.get_post_by_slug(slug) do
      nil ->
        conn
        |> put_flash(:error, "Blog post not found.")
        |> redirect(to: ~p"/blog")

      post ->
        if post.published do
          render(conn, :show, post: post)
        else
          conn
          |> put_flash(:error, "Blog post not found.")
          |> redirect(to: ~p"/blog")
        end
    end
  end
end
