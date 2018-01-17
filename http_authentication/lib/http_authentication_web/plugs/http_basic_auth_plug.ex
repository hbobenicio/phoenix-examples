# https://tools.ietf.org/html/rfc2617
# https://medium.com/@paulfedory/basic-authentication-in-your-phoenix-app-fa24e57baa8
# https://gist.github.com/hbobenicio/b21b840004b54ca120c5cca14300fcb6

defmodule HttpAuthenticationWeb.Plug.HttpBasicAuth do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, access_auth) do
    case get_req_header(conn, "authorization") do
      ["Basic " <> client_auth] -> check_auth(conn, client_auth, access_auth)
      _ -> unauthorize(conn)
    end
  end

  defp check_auth(conn, client_auth, [user_id: user_id, password: password] = access_auth) do

  end

  defp unauthorize(conn) do
    # conn
    # |> send_resp(:forbidden, "") # forbidden = status code 403
    conn
    |> put_resp_header("WWW-Authenticate", "Basic realm=\"Http Basic Authentication secured resource area\"")
    |> send_resp(:unauthorized, "") # unauthorized = status code 401
  end

  defp encode(username, password) do
    Base.encode64 "#{username}:#{password}"
  end
end
