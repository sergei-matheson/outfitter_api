defmodule OutfitterApiWeb.Router do
  use OutfitterApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OutfitterApiWeb do
    pipe_through :api
  end
end
