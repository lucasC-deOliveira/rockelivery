defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 22,
      address: "Rua dos ipes",
      cep: "12345678",
      name: "Lucas",
      cpf: "12345678901",
      email: "lucas@gmail.com",
      password: "123456",
   }

  end

  def user_factory do
    %User{
      age: 22,
      address: "Rua dos ipes",
      cep: "12345678",
      name: "Lucas",
      cpf: "12345678901",
      email: "lucas@gmail.com",
      password: "123456",
      id: "0344175f-863d-4067-a266-b851755d3ef9"
    }
  end
end
