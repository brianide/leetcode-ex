defmodule Solution do
  @spec equal_pairs(grid :: [[integer]]) :: integer
  def equal_pairs(grid) do
    rows =
      Enum.group_by(grid, fn x -> x end)
      |> Map.new(fn {id, seq} -> {id, Enum.count(seq)} end)

    Enum.zip_with(grid, fn x -> x end)
    |> Enum.map(&Map.get(rows, &1, 0))
    |> Enum.sum()
  end
end
