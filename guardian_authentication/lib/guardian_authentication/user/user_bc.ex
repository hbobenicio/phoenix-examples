defmodule GuardianAuthentication.User.Business.UserBC do
  @moduledoc """
  Business Controller for User
  """
  alias GuardianAuthentication.User.Model.User

  @doc """
  A mocked user list
  """
  @spec users_mock :: [%User{}]
  def users_mock do
    [
      %User{identifier: "foo", password: "1234"},
      %User{identifier: "bar", password: "4321"}
    ]
  end

  @doc """
  Returns a list of all users
  """
  @spec list_users :: [%User{}]
  def list_users do
    users_mock()
  end

  @doc """
  Authenticate a user, given the identifier and its password
  """
  @spec authenticate?(String.t(), String.t()) :: boolean()
  def authenticate?(identifier, password) do
    list_users()
    |> Enum.find(fn(user) -> user.identifier == identifier && user.password == password end)
  end

end
