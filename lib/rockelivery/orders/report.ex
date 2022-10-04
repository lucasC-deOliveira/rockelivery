defmodule Rockelivery.Orders.Report do
  import Ecto.Query

  alias Rockelivery.{Repo, Order}

  def create(filename \\ "report.csv") do
    query = from order in Order, order_by: order.user_id

    Repo.transaction(fn ->
      query
      |> Repo.stream()
      |> Stream.run()

    end)
  end

end
