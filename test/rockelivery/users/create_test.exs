defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  import Mox

  alias Rockelivery.{Error,User}

  alias Rockelivery.Users.Create

  alias Rockelivery.ViaCep.ClientMock
  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      expect(ClientMock, :get_cep_info, fn _cep ->
       {:ok, build(:cep_info)}
      end)

      response = Create.call(params)

      assert {:ok,
      %User{
        age: 22,
        email: "lucas@gmail.com",
        id: _id
      }} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{"password" => "123", "age" => 15})

      response = Create.call(params)

      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }


      assert errors_on(changeset) == expected_response
    end
  end
end
