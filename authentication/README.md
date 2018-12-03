# Authentication

```bash
mix phx.new authentication --no-brunch --no-html
touch docker-compose.yml # configurar serviço do banco
vim config/dev.exs # configure os dados de conexão com o banco
mix phx.gen.schema Usuario usuarios nome:string email:string senha_hash:string
vim lib/authentication/usuario.ex
mix ecto.migrate
vim lib/authentication_web/router.ex # Adicione a rota post /api/usuarios
```
