defmodule AuthenticationWeb.Controllers.UsuarioController do
  @moduledoc """
  Controller para o recurso Usuário (rota: /usuarios)
  """
  use AuthenticationWeb, :controller
  alias Authentication.Usuario.UsuarioBC

  def create(conn, %{"nome" => _nome, "email" => _email, "senha" => _senha} = payload) do
    case UsuarioBC.criar_usuario(payload) do
      {:ok, usuario} ->
        conn
        |> send_resp(:created, "") # TODO retornar usuário
      
      {:error, motivo} ->
        conn
        |> send_resp(:unprocessable_entity, "") # TODO retornar json de erro
    end
  end

  def create(conn, _payload) do
    conn
    |> send_resp(:bad_request, "")
  end

  def index(conn, _params) do
    usuarios = UsuarioBC.listar_usuarios()

    render conn, "usuarios.json", usuarios
  end

end
