defmodule PortfolioTemplateWeb.Router do
  use PortfolioTemplateWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PortfolioTemplateWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_path
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug PortfolioTemplateWeb.Plugs.RequireAuth
  end

  scope "/", PortfolioTemplateWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/works", PageController, :works
    get "/blog", PageController, :blog
    get "/blog/:slug", PageController, :blog_post
  end

  scope "/admin", PortfolioTemplateWeb do
    pipe_through :browser

    get "/", AuthController, :index
    get "/login", AuthController, :new
    post "/login", AuthController, :create
    get "/login/sent", AuthController, :sent
    get "/verify", AuthController, :verify
    delete "/logout", AuthController, :delete
  end

  scope "/admin/blog", PortfolioTemplateWeb do
    pipe_through [:browser, :admin]

    get "/", AdminController, :index
    get "/new", AdminController, :new
    post "/", AdminController, :create
    get "/:id/edit", AdminController, :edit
    post "/:id", AdminController, :update
    post "/:id/delete", AdminController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", PortfolioTemplateWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard in development
  if Application.compile_env(:portfolio_template, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PortfolioTemplateWeb.Telemetry
    end
  end

  defp assign_current_path(conn, _opts) do
    Plug.Conn.assign(conn, :current_path, conn.request_path)
  end
end
