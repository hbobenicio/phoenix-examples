defmodule GuardianAuthentication.User.Business.UserBC do
  alias GuardianAuthentication.User.Model.User

  def users_mock do
    [
      %User{identifier: "foo", password: "1234"},
      %User{identifier: "bar", password: "4321"}
    ]
  end

  def list_users do
    users_mock()
  end

  def exists?(identifier, password) do
    list_users()
    |> Enum.find(fn(user) -> user.identifier == identifier && user.password == password end)
  end

end
