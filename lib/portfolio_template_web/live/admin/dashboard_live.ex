defmodule PortfolioTemplateWeb.Admin.DashboardLive do
  use PortfolioTemplateWeb, :live_view

  alias PortfolioTemplate.Blog

  @impl true
  def mount(_params, _session, socket) do
    posts = Blog.list_all_posts()

    {:ok,
     socket
     |> assign(:posts, posts)
     |> assign(:selected_post, nil)
     |> assign(:editing_post, new_post_changeset())
     |> assign(:view_mode, :new)}
  end

  @impl true
  def handle_params(%{"id" => id}, _uri, socket) do
    post = Blog.get_post!(String.to_integer(id))
    changeset = Blog.change_post(post)

    {:noreply,
     socket
     |> assign(:selected_post, post)
     |> assign(:editing_post, changeset)
     |> assign(:view_mode, :edit)}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("select_post", %{"id" => id}, socket) do
    {:noreply, push_patch(socket, to: ~p"/admin?id=#{id}")}
  end

  def handle_event("new_post", _params, socket) do
    {:noreply,
     socket
     |> assign(:selected_post, nil)
     |> assign(:editing_post, new_post_changeset())
     |> assign(:view_mode, :new)
     |> push_patch(to: ~p"/admin")}
  end

  def handle_event("validate", %{"post" => post_params}, socket) do
    changeset =
      case socket.assigns.view_mode do
        :new ->
          Blog.change_post(%Blog.Post{}, post_params)

        :edit ->
          Blog.change_post(socket.assigns.selected_post, post_params)
      end
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :editing_post, changeset)}
  end

  def handle_event("save", %{"post" => post_params}, socket) do
    case socket.assigns.view_mode do
      :new ->
        save_new_post(socket, post_params)

      :edit ->
        save_existing_post(socket, post_params)
    end
  end

  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(String.to_integer(id))

    case Blog.delete_post(post) do
      {:ok, _post} ->
        posts = Blog.list_all_posts()

        {:noreply,
         socket
         |> assign(:posts, posts)
         |> assign(:selected_post, nil)
         |> assign(:editing_post, new_post_changeset())
         |> assign(:view_mode, :new)
         |> put_flash(:info, "Post deleted successfully")
         |> push_patch(to: ~p"/admin")}

      {:error, _changeset} ->
        {:noreply, put_flash(socket, :error, "Failed to delete post")}
    end
  end

  defp save_new_post(socket, post_params) do
    case Blog.create_post(post_params) do
      {:ok, post} ->
        posts = Blog.list_all_posts()

        {:noreply,
         socket
         |> assign(:posts, posts)
         |> assign(:selected_post, post)
         |> assign(:editing_post, Blog.change_post(post))
         |> assign(:view_mode, :edit)
         |> put_flash(:info, "Post created successfully")
         |> push_patch(to: ~p"/admin?id=#{post.id}")}

      {:error, changeset} ->
        {:noreply, assign(socket, :editing_post, changeset)}
    end
  end

  defp save_existing_post(socket, post_params) do
    case Blog.update_post(socket.assigns.selected_post, post_params) do
      {:ok, post} ->
        posts = Blog.list_all_posts()

        {:noreply,
         socket
         |> assign(:posts, posts)
         |> assign(:selected_post, post)
         |> assign(:editing_post, Blog.change_post(post))
         |> put_flash(:info, "Post updated successfully")}

      {:error, changeset} ->
        {:noreply, assign(socket, :editing_post, changeset)}
    end
  end

  defp new_post_changeset do
    Blog.change_post(%Blog.Post{})
  end
end
