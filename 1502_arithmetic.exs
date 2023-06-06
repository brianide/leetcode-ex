defmodule Solution do
  @spec can_make_arithmetic_progression(arr :: [integer]) :: boolean
  def can_make_arithmetic_progression(arr) do
    Enum.sort(arr)
    |> pairwise()
    |> Enum.map(fn [a, b] -> b - a end)
    |> pairwise()
    |> Enum.all?(fn [a, b] -> a == b end)
  end

  def pairwise(arr), do: Enum.chunk_every(arr, 2, 1, :discard)
end
