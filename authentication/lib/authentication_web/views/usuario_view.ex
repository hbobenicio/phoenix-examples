defmodule AuthenticationWeb.Usuario.UsuarioView do
  use AuthenticationWeb, :view

  def render("usuarios.json", usuarios) do
    IO.inspect usuarios
    
    Enum.map(usuarios, &usuario_json/1)
  end

  def usuario_json(usuario) do
    %{
      nome: usuario.nome,
      email: usuario.email,
      inserted_at: usuario.inserted_at,
      updated_at: usuario.updated_at
    }
  end  
end
