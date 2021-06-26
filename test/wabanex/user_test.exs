defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: alias(Wabanex.User)

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Wender", email: "wender@banana.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{name: "Wender", email: "wender@banana.com", password: "123456"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{name: "x", email: "wender@banana.com"}

      response = User.changeset(params)

      assert errors_on(response) == %{
               name: ["should be at least 2 character(s)"],
               password: ["can't be blank"]
             }
    end
  end
end
