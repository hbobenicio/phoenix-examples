defmodule Authentication.Usuario.UsuarioBC do
  @moduledoc """
  Módulo com as Regras de Negócio de Usuários
  """
  alias Authentication.Usuario
  alias Authentication.Repo

  def listar_usuarios do
    Usuario
    |> Repo.all
  end
  
  @doc """
  Cria um novo usuário
  """
  def criar_usuario(%{"nome" => _nome, "email" => _email, "senha" => _senha} = atributos) do
    changeset = Usuario.create_changeset %Usuario{}, atributos

    case Repo.insert(changeset) do
      {:ok, usuario} ->
        IO.puts "Usuário criado com sucesso."
        {:ok, usuario}

      {:error, changeset} ->
        IO.puts "Erro ao criar usuário. Changeset:"
        IO.inspect changeset
        {:error, "Erro ao criar usuário."}
    end
  end
  
end
