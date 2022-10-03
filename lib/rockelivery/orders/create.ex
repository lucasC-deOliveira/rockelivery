defmodule Rockelivery.Order.Create do
  import Ecto.Query

  alias Rockelivery.{Error, Repo, Item, Order}

  def call(params) do
    params
    |> fetch_items()
  end

  defp fetch_items(%{"items" => items_params}) do
    item_ids = Enum.map(items_params, fn item -> item["id"] end)

    query = from item in Item, where: item.id in ^item_ids

    query
    |> Repo.all()
    |> validate_items(item_ids)
  end

  defp validate_items(items, items_ids) do
    items_map = Map.new(items, fn item -> {item.id, item} end)

    items_ids
    |> Enum.map(fn id -> {id, Map.get(items_map, id)} end)
    |> Enum.any?(fn {_id,value} -> is_nil(value) end)
  end
end
