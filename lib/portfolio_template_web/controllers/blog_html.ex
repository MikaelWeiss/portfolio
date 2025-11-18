defmodule PortfolioTemplateWeb.BlogHTML do
  @moduledoc """
  HTML views for blog pages.
  """
  use PortfolioTemplateWeb, :html

  embed_templates "blog_html/*"

  def format_date(datetime) do
    Calendar.strftime(datetime, "%B %d, %Y")
  end

  def reading_time(content) do
    words = content |> String.split() |> length()
    minutes = ceil(words / 200)
    "#{minutes} min read"
  end
end
