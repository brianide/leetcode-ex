defmodule Solution do
  @spec is_monotonic(nums :: [integer]) :: boolean
  def is_monotonic([_]), do: true

  def is_monotonic(nums) do
    Enum.chunk_every(nums, 2, 1, :discard)
    |> Enum.map(fn [a, b] -> b - a end)
    |> Enum.reduce_while(0, fn
      0, diff -> {:cont, diff}
      n, 0 -> {:cont, n}
      n, diff -> if (n > 0) == (diff > 0), do: {:cont, n}, else: {:halt, false}
    end)
    |> then(fn
      false -> false
      _ -> true
    end)
  end
end
