defmodule GuardianAuthenticationWeb.Auth.Controllers.AuthController do
  use GuardianAuthenticationWeb, :controller
  alias GuardianAuthenticationWeb.Auth.Guardian

  # POST /auth
  def auth(conn, %{"identifier" => identifier, "password" => password} = _params) do
    # Search the user by identifier and password. If it finds, generate a token for it
    if identifier == "foo" && password == "1234" do
      # gerar token, set cookie, reponse 200

      # encode a token for a resource
      {:ok, token, claims} = Guardian.encode_and_sign(identifier)

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
