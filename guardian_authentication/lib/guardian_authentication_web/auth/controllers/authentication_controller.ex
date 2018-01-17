defmodule GuardianAuthenticationWeb.Auth.Controllers.AuthController do
  use GuardianAuthenticationWeb, :controller
  alias GuardianAuthenticationWeb.Auth.Guardian
  alias GuardianAuthentication.User.Business.UserBC

  # TODO add fallback_controller

  # POST /auth
  def auth(conn, %{"identifier" => identifier, "password" => password} = _params) do

    if UserBC.exists?(identifier, password) do

      # encode a token for a resource
      {:ok, token, _claims} = Guardian.encode_and_sign(identifier)

      conn
      |> put_resp_cookie("token", token, domain: "localhost", max_age: 60)
      |> send_resp(:ok, "") # :ok = status code "200"
    else
      conn
      |> send_resp(:forbidden, "") # :forbidden = status code "403"
    end
  end

  def auth(conn, params) do
    IO.puts "Attempt to authenticate with incorrect params. Resquest Params:"
    IO.inspect params

    conn
    |> send_resp(:bad_request, "") # :bad_request = status code "400"
  end
end
