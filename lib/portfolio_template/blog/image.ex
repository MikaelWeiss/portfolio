defmodule PortfolioTemplate.Blog.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blog_images" do
    field :filename, :string
    field :original_filename, :string
    field :content_type, :string
    field :size, :integer
    field :alt_text, :string

    belongs_to :blog_post, PortfolioTemplate.Blog.Post

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:filename, :original_filename, :content_type, :size, :alt_text, :blog_post_id])
    |> validate_required([:filename, :original_filename, :blog_post_id])
  end
end
