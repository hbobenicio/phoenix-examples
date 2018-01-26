defmodule GuardianAuthenticationWeb.Cake.Controllers.CakeController do
  use GuardianAuthenticationWeb, :controller

  def get_cake(conn, _params) do
    cake = %{data: "Here is your cake..." }
    
    conn
    |> json(cake)
  end
end
