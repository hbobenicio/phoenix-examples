# guardian-authentication

## Want to benchmark this?

`ab -p login.data.json -T application/json -c 100 -n 50000 http://localhost:4000/api/auth`

## Want to build it?

```bash
MIX_ENV=prod mix phx.digest
MIX_ENV=prod mix phx.release
```

## Want to run it?

Running as Debug: Foreground process + No IEx Session

```bash
mix phx.server
```

Running as Debug: Foreground process + IEx Session

```bash
iex -S mix phx.server
```

Running as Production Release

```bash
PORT=8088 _build/prod/rel/guardian_authentication/bin/guardian_authentication foreground
```

## What have I done

- I'm following the [official guide](https://github.com/ueberauth/guardian)
- I've created a new clean project with `mix phx.new guardian_authentication --no-brunch --no-html --no-ecto`
- I've added the Guardian dependency at mix.exs
  ```elixir
  defp deps do
    [{:guardian, "~> 1.0"}]
  end
  ```
- I've then installed the guardian dependency with `mix deps.get`
- I've created a new module that uses the Guardian (see `GuardianAuthenticationWeb.Auth.Guardian`)
- I've generated a new private key (secret) for this app with `mix guardian.gen.secret`
- I've added a configuration for Guardian

  ```elixir
  # Guardian Configuration (Authentication Module)
  config :guardian_authentication, GuardianAuthenticationWeb.Auth.Guardian,
    issuer: "guardian_authentication_app",
    secret_key: "YOUR_GENERATED_PRIVATE_KEY_HERE"
  ```

- I've tested if everything is working fine with `iex -S mix`

  ```elixir
  alias GuardianAuthenticationWeb.Auth.Guardian, as: Token
  {:ok, token, claims} = Token.encode_and_sign("my-subject")
  {:ok, claims} = Token.decode_and_verify(token)
  {:ok, resource, claims} = Token.resource_from_token(token)
  ```
- I've added Plugs on the API Pipeline to secure the routes with token based authentication
  - Setting the Guardian Pipeline

- Deployment
  - I've configured the Release Build pipeline as documented in: `https://blog.dockbit.com/deploying-elixir-applications-with-docker-1e1dd5b39ab9`
    - Added Distillery dependency (don't forget to `mix deps.get`)
  	- `mix release.init`
