defmodule PortfolioTemplateWeb.PageController do
  use PortfolioTemplateWeb, :controller
  alias PortfolioTemplate.Data

  def home(conn, _params) do
    render(conn, :home,
      personal: Data.get_personal(),
      about: Data.get_about(),
      skills: Data.get_skills(),
      experience: Data.get_experience(),
      projects: Data.get_featured_projects(),
      awards: Data.get_awards(),
      volunteer: Data.get_volunteer(),
      education: Data.get_education()
    )
  end

  def works(conn, _params) do
    render(conn, :works, projects: Data.get_all_projects())
  end

  def blog(conn, _params) do
    render(conn, :blog)
  end
end
