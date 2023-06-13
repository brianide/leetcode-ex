defmodule Solution do
  @spec equal_pairs(grid :: [[integer]]) :: integer
  def equal_pairs(grid) do
    row_freqs = Enum.frequencies(grid)

    Enum.zip_with(grid, fn x -> x end)
    |> Enum.map(&Map.get(row_freqs, &1, 0))
    |> Enum.sum()
  end
end
