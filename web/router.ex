defmodule Glitchr.Router do
  use Glitchr.Web, :router

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

  scope "/", Glitchr do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/admin", Glitchr do
    pipe_through :browser

    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Glitchr do
  #   pipe_through :api
  # end
end
