defmodule Solution do
  @spec count_negatives(grid :: [[integer]]) :: integer
  def count_negatives(grid) do
    width = length(hd(grid))
    Enum.reduce(grid, 0, fn line, count ->
      case Enum.find_index(line, &(&1 < 0)) do
        nil -> count
        n -> count + width - n
      end
    end)
  end
end
