defmodule XparWeb.Router do
  use XparWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

   scope "/", XparWeb do
     pipe_through :browser # Use the default browser stack

     get "/teams/:id", StatController, :show
   end

  # Other scopes may use custom stacks.
  scope "/api", XparWeb do
    pipe_through :api
    get "/teams/:id/pairing-matrix", PairController, :get
    get "/teams/:id/repos", TeamsController, :get_repos
    post "/teams/:id/repos", TeamsController, :create_repos
    get "/teams/:id/members", TeamsController, :get_members
    post "/teams/:id/members", TeamsController, :create_members
  end
end
