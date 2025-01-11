defmodule PortfolioTemplateWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use PortfolioTemplateWeb, :html

  embed_templates "page_html/*"

  def filter_projects(projects, "all"), do: projects

  def filter_projects(projects, filter) do
    Enum.filter(projects, fn project -> project.type == filter end)
  end
end
