defmodule Rockelivery.Users.Get do
  alias Rockelivery.{Repo,User}

  alias Ecto.UUID

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> get(uuid)
    end

  end

  defp get(id) do
    case Repo.get(User, id) do
    nil -> {:error, %{status: :not_found, result: "User not found!"}}
    user -> {:ok, user}
    end
  end
end
