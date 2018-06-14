defmodule GuardianAuthenticationWeb.Auth.Controllers.AuthController do
  @moduledoc """
  Controller for handling requests for Auth Resources
  """
  use GuardianAuthenticationWeb, :controller
  alias GuardianAuthenticationWeb.Auth.Guardian
  alias GuardianAuthentication.User.Business.UserBC

  # TODO add a fallback_controller

  @doc """
  Simple authentication (identifier/password based) endpoint.
  
  POST /auth {"identifier": "foo", "password": "1234"}
  """
  def auth(conn, %{"identifier" => identifier, "password" => password} = _params) do

    if UserBC.authenticate?(identifier, password) do

      # encode a token for a resource
      {:ok, token, _claims} = Guardian.encode_and_sign(identifier)
      # Maybe `Guardian.sign_in(identifier)` could also be used here...

      conn
      |> put_resp_header("Authorization", "Bearer " <> token)
      |> send_resp(:ok, "")

      # Responding as a Web Cookie
      # conn
      # |> put_resp_cookie("token", token, domain: "localhost", max_age: 60)
      # |> send_resp(:ok, "")
    else
      conn
      |> send_resp(:forbidden, "") # :forbidden = status code "403"
    end
  end

  def auth(conn, params) do
    IO.puts "Attempt to authenticate with incorrect params."

    conn
    |> send_resp(:bad_request, "") # :bad_request = status code "400"
  end
end
