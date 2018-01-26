defmodule GuardianAuthenticationWeb.Debug.Plugs.Inspect do
  @moduledoc """
  This Plug inspects the `conn` and `params`.
  """
  import Plug.Conn

  @doc false
  def init(params), do: params

  # TODO Add params to select with data to inspect
  @doc false
  def call(conn, params) do
    IO.puts "==== CONN ===="
    # IO.inspect conn
    IO.puts "==== PARAMS ===="
    IO.inspect params
    
    resource = GuardianAuthenticationWeb.Auth.Guardian.Plug.current_resource(conn)
    claims = GuardianAuthenticationWeb.Auth.Guardian.Plug.current_claims(conn)

    IO.puts "==== RESOURCE / CLAIMS ===="
    IO.inspect resource
    IO.inspect claims

    conn
  end
end
