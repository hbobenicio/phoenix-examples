defmodule GuardianAuthenticationWeb.Router do
  use GuardianAuthenticationWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GuardianAuthenticationWeb do
    pipe_through :api
  end
end
