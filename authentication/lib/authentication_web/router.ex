defmodule AuthenticationWeb.Router do
  use AuthenticationWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AuthenticationWeb.Controllers do
    pipe_through :api

    post "/usuarios", UsuarioController, :create
    get "/usuarios", UsuarioController, :index
  end
end
