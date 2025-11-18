defmodule PortfolioTemplate.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PortfolioTemplateWeb.Telemetry,
      PortfolioTemplate.Repo,
      {DNSCluster, query: Application.get_env(:portfolio_template, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PortfolioTemplate.PubSub},
      {Finch, name: PortfolioTemplate.Finch},
      # Start a worker by calling: PortfolioTemplate.Worker.start_link(arg)
      # {PortfolioTemplate.Worker, arg},
      # Start to serve requests, typically the last entry
      PortfolioTemplateWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PortfolioTemplate.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PortfolioTemplateWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
