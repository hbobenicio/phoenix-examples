defmodule GuardianAuthenticationWeb.Auth.Guardian do
  use Guardian, otp_app: :guardian_authentication

  def subject_for_token(resource, _claims) do
    # You can use any value for the subject of your token but
    # it should be useful in retrieving the resource later, see
    # how it being used on `resource_from_claims/1` function.
    # A unique `id` is a good subject, a non-unique email address
    # is a poor subject.
    # sub = to_string(resource.id)
    # {:ok, sub}

    # In this case, we're using the identifier as the resource
    # to generate the token. It's also our subject.
    identifier = resource
    subject = identifier

    {:ok, subject}
  end

  def subject_for_token(_, _) do
    {:error, :invalid_subject}
  end

  def resource_from_claims(claims) do
    # Here we'll look up our resource from the claims, the subject can be
    # found in the `"sub"` key. In `above subject_for_token/2` we returned
    # the resource id so here we'll rely on that to look it up.
    identifier = claims["sub"]

    # resource = MyApp.get_resource_by_id(id)
    # In this case, our resource is just the subject, which hold the
    # identifier itself
    #
    # user = UserBC.find_by_id(identifier)

    # {:ok,  resource}
    {:ok, identifier}
  end

  def resource_from_claims(_claims) do
    {:error, :invalid_claim}
  end

end
