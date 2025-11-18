defmodule PortfolioTemplate.Upload do
  @moduledoc """
  Handles file uploads for blog images.
  """

  @upload_dir "priv/static/uploads/blog"

  def save_blog_image(upload) do
    filename = generate_filename(upload.filename)
    dest_path = Path.join(@upload_dir, filename)

    case File.cp(upload.path, dest_path) do
      :ok ->
        {:ok, "/uploads/blog/#{filename}"}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def delete_blog_image(path) do
    file_path = Path.join("priv/static", path)

    case File.rm(file_path) do
      :ok -> :ok
      {:error, :enoent} -> :ok
      {:error, reason} -> {:error, reason}
    end
  end

  defp generate_filename(original_filename) do
    ext = Path.extname(original_filename)
    timestamp = DateTime.utc_now() |> DateTime.to_unix()
    random = :crypto.strong_rand_bytes(8) |> Base.url_encode64(padding: false)
    "#{timestamp}-#{random}#{ext}"
  end
end
