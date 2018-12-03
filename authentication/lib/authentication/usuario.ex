defmodule Authentication.Usuario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuarios" do
    field :nome, :string
    field :email, :string
    field :senha, :string, virtual: true
    field :senha_hash, :string

    timestamps()
  end

  @doc false
  def create_changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:nome, :email, :senha])
    |> validate_required([:nome, :email, :senha])
    |> validate_length(:nome, min: 3, max: 255)
    |> validate_length(:email, min: 5, max: 255)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:senha, min: 4, max: 255)
    |> put_senha_hash()
  end

  defp put_senha_hash(changeset) do
    senha = get_change(changeset, :senha)
    senha_com_sal = senha <> "sal faz bem!"

    # TODO substituir este algoritmo sha512 pelo bcrypt
    senha_hash = :crypto.hash(:sha512, senha_com_sal) |> Base.encode64

    # Adicionando o hash da senha aos atributos
    changeset
    |> put_change(:senha_hash, senha_hash)
  end
end
