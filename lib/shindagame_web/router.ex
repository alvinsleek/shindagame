defmodule ShindagameWeb.Router do
  use ShindagameWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ShindagameWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShindagameWeb do
    pipe_through :browser

    get "/", PageController, :home

    get "/games", GameController, :index
    get "/bet", BetController, :new
    post "/bet", BetController, :create
    get "/bet/cancel", BetController, :cancel
    post "/bet/cancel", BetController, :cancel_bet
    get "/bet/history", BetController, :history
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShindagameWeb do
  #   pipe_through :api
  # end

  pipeline :frontend_access do
    plug ShindagameWeb.Middleware.RoleAuthorization
  end

  scope "/frontend" do
    pipe_through [:browser, :frontend_access]

    get "/", PageController, :index
    get "/profile", UserController, :profile
  end

  pipeline :admin_access do
    plug ShindagameWeb.Middleware.RoleAuthorization
  end

  scope "/admin", ShindagameWeb do
    pipe_through [:browser, ShindagameWeb.Plugs.AdminAccess]

    get "/user/:user_id", AdminController, :show
    get "/user/:user_id/delete", AdminController, :delete
    post "/user/:user_id/delete", AdminController, :soft_delete
    get "/profit", AdminController, :index

    get "/", AdminDashboardController, :index
    get "/users", AdminUserController, :index
  end


  pipeline :superuser_access do
    plug ShindagameWeb.Middleware.RoleAuthorization
  end

  scope "/superuser" do
    pipe_through [:browser, :superuser_access]

    get "/", SuperuserDashboardController, :index
    get "/configure_games", SuperuserGameController, :configure

    get "/game_config", GameConfigController, :index
    post "/game_config", GameConfigController, :configure

    get "/admin_access", AdminAccessController, :index
    post "/admin_access/grant", AdminAccessController, :grant_admin_access
    post "/admin_access/revoke", AdminAccessController, :revoke_admin_access

    get "/email_config", EmailConfigController, :index
    post "/email_config", EmailConfigController, :configure_email_notifications
    end
  end


  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:shindagame, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    # scope "/dev" do
    #   pipe_through :browser

    #   live_dashboard "/dashboard", metrics: ShindagameWeb.Telemetry
    #   forward "/mailbox", Plug.Swoosh.MailboxPreview
    # end
  end
# end
