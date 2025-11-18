defmodule PortfolioTemplate.Repo do
  use Ecto.Repo,
    otp_app: :portfolio_template,
    adapter: Ecto.Adapters.Postgres
end
