defmodule Rockelivery.Order.Create do
  import Ecto.Query

  alias Rockelivery.{Error, Repo,Item, Order}

  def call(params) do
    params
    |> fetch_items()
  end

  defp fetch_items(%{"items" => items_params}) do
    item_ids = Enum.map(item_params, fn item -> item["id"] end)

    query = from item in Item, where: item.id in ^item_ids

    query
    |> Repo.all()
  end
end
