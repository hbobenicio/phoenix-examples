defmodule Authentication.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nome, :string
      add :email, :string
      add :senha_hash, :string

      timestamps()
    end

  end
end
