import Config

# Configure your database
config :portfolio_template, PortfolioTemplate.Repo,
  username: "mikaelweiss",
  password: System.get_env("DATABASE_PASSWORD") || "postgres",
  hostname: "localhost",
  database: "portfolio_template_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :portfolio_template, PortfolioTemplateWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "UayZ8hEjLEewcXVOTrGYvlVwAisZVhdaa+3YrwOzkIed6LpSzHY3wL0jzBLYgyZI",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
