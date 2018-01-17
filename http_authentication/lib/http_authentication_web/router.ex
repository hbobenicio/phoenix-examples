defmodule HttpAuthenticationWeb.Router do
  use HttpAuthenticationWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HttpAuthenticationWeb do
    pipe_through :api
  end
end
