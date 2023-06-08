defmodule Solution do
  @spec count_negatives(grid :: [[integer]]) :: integer
  def count_negatives(grid) do
    width = length(hd(grid))
    Enum.reduce(grid, {0, width}, fn line, {count, maxlen} ->
      case Enum.take(line, maxlen) |> Enum.find_index(&(&1 < 0)) do
        nil -> {count + width - maxlen, maxlen}
        n -> {count + width - n, n}
      end
    end)
    |> elem(0)
  end
end
