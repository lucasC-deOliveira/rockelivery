defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View

  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "render create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "Rua dos ipes",
               age: 22,
               cep: "12345678",
               cpf: "12345678901",
               email: "lucas@gmail.com",
               id: "0344175f-863d-4067-a266-b851755d3ef9",
               inserted_at: nil,
               name: "Lucas",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } == response
  end
end
