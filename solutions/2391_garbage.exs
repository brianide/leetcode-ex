defmodule Solution do
  @spec garbage_collection(garbage :: [String.t], travel :: [integer]) :: integer
  def garbage_collection(garbage, travel) do
    {trash, indices} =
      Enum.with_index(garbage)
      |> Enum.reduce({0, %{}}, fn {house, index}, {total, indices} ->
        total = total + String.length(house)
        indices =
          String.graphemes(house)
          |> Enum.uniq()
          |> Enum.reduce(indices, &Map.put(&2, &1, index))
        {total, indices}
      end)

    travel =
      Map.values(indices)
      |> Enum.flat_map(&Enum.take(travel, &1))
      |> Enum.sum()

    trash + travel
  end
end
