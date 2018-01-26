defmodule GuardianAuthenticationWeb.Router do
  use GuardianAuthenticationWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Setup the Guardian Pipeline
  pipeline :guardian_secured_api do

    # Plug our Guardian Module and ErrorHandler auth errors response handling
    plug Guardian.Plug.Pipeline,
      module: GuardianAuthenticationWeb.Auth.Guardian, # Implementation Module
      error_handler: GuardianAuthenticationWeb.Auth.ErrorHandler

    # Looks for and validates a token found in the `Authorization` header.
    # If a token is found but is invalid, the error handler will be called with
    # `auth_error(conn, {:invalid_token, reason}, opts)`.
    # For now, we are only validating if the conn has `Authorization Bearer: TOKEN`
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"

    # This plug ensures that a valid token was provided and has been verified on the request.
    # If one is not found, the `auth_error` will be called with `:unauthenticated`
    plug Guardian.Plug.EnsureAuthenticated

    # After the LoadResource Plug, you can access the resource loaded from the
    # token with:
    #   `resource = GuardianAuthenticationWeb.Auth.Guardian.Plug.current_resource(conn)`
    # claims are also accessible with:
    #   `claims = GuardianAuthenticationWeb.Auth.Guardian.Plug.current_claims(conn)`
    plug Guardian.Plug.LoadResource
  end

  scope "/api", GuardianAuthenticationWeb do
    pipe_through :api

    post "/auth", Auth.Controllers.AuthController, :auth # With a pipeline like that, this should halt()!

    # Secures the API with the Guardian Pipeline
    pipe_through :guardian_secured_api

    # Starting from here, the api is secured. A valid token is needed.
    get "/cake", Cake.Controllers.CakeController, :get_cake
  end
end
