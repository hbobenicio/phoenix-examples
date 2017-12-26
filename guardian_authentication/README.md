# guardian-authentication

## What have I done

- I'm following the [official guide](https://github.com/ueberauth/guardian)
- I've created a new project with `mix phx.new guardian_authentication --no-brunch --no-html --no-ecto`
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
  - `TODO`
