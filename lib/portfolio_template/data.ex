defmodule PortfolioTemplate.Data do
  @portfolio_data "priv/static/data/portfolio_data.json"
                  |> File.read!()
                  |> Jason.decode!()

  def get_all, do: @portfolio_data
  def get_personal, do: @portfolio_data["personal"]
  def get_about, do: @portfolio_data["about"]
  def get_skills, do: @portfolio_data["skills"]
  def get_experience, do: @portfolio_data["experience"]
  def get_projects, do: @portfolio_data["projects"]
  def get_awards, do: @portfolio_data["awards"]
  def get_volunteer, do: @portfolio_data["volunteer"]
  def get_education, do: @portfolio_data["education"]

  def get_featured_projects, do: @portfolio_data["projects"]["featured"]

  def get_all_projects,
    do: @portfolio_data["projects"]["featured"] ++ @portfolio_data["projects"]["all"]
end
