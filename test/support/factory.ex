defmodule Rockelivery.Factory do
  use ExMachina

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
end
