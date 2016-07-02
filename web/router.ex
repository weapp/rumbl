defmodule Rumbl.Router do
  use Rumbl.Web, :router

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

  scope "/", Rumbl do
    pipe_through :browser # Use the default browser stack

    # get "/users", UserController, :index
    # get "/users/:id", UserController, :show

    resources "/users", UserController, only: [:index, :show, :new, :create]
    # get "/users", UserController, :index
    # get "/users/:id/edit", UserController, :edit
    # get "/users/new", UserController, :new
    # get "/users/:id", UserController, :show
    # post "/users", UserController, :create
    # patch "/users/:id", UserController, :update
    # put "/users/:id", UserController, :update
    # delete "/users/:id", UserController, :delete



    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Rumbl do
  #   pipe_through :api
  # end
end
