defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Rockelivery.User

  alias Ecto.Changeset

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
         age: 22,
         address: "Rua dos ipes",
         cep: "12345678",
         name: "Lucas",
         cpf: "12345678901",
         email: "lucas@gmail.com",
         password: "123456",
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Lucas"}, valid?: true} = response
    end
    test "when updating a changeset, returns a valid changeset with the given changes" do
        params = %{
           age: 22,
           address: "Rua dos ipes",
           cep: "12345678",
           name: "Lucas",
           cpf: "12345678901",
           email: "lucas@gmail.com",
           password: "123456",
        }

        update_params = %{name: "Jorge"}

        response =
        params
        |> User.changeset()
        |> User.changeset(update_params)



        assert %Changeset{changes: %{name: "Jorge"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
        params = %{
           age: 22,
           address: "Rua dos ipes",
           cep: "12345678",
           name: "Lucas",
           cpf: "12345678901",
           email: "lucas@gmail.com",
           password: "123",
        }

        response = User.changeset(params)

        expected_response = %{password: ["should be at least 6 character(s)"]}

        assert errors_on(response) == expected_response
    end
  end


end
