defmodule PortfolioTemplate.Data do
  @portfolio_data_path "priv/static/data/portfolio_data.json"

  def get_all do
    @portfolio_data_path
    |> File.read!()
    |> Jason.decode!(keys: :atoms)
  end

  def get_personal, do: get_all()[:personal]
  def get_about, do: get_all()[:about]
  def get_skills, do: get_all()[:skills]
  def get_experience, do: get_all()[:experience]
  def get_projects, do: get_all()[:projects]
  def get_awards, do: get_all()[:awards]
  def get_volunteer, do: get_all()[:volunteer]
  def get_education, do: get_all()[:education]

  def get_featured_projects, do: get_all()[:projects][:featured]

  def get_all_projects,
    do: get_all()[:projects][:featured] ++ get_all()[:projects][:all]
end
