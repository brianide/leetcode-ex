defmodule Solution do
  @spec garbage_collection(garbage :: [String.t], travel :: [integer]) :: integer
  def garbage_collection(garbage, travel) do
    Enum.zip(garbage, [0 | travel])
    |> Enum.reverse()
    |> Enum.reduce({0, MapSet.new()}, fn {trash, travel}, {total, seen} ->
      seen = String.graphemes(trash) |> Enum.reduce(seen, &MapSet.put(&2, &1))
      total = total + String.length(trash) + MapSet.size(seen) * travel
      {total, seen}
    end)
    |> then(&Kernel.elem(&1, 0))
  end
end
