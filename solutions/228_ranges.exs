defmodule Solution do
  @spec summary_ranges(nums :: [integer]) :: [String.t]
  def summary_ranges([]), do: []

  def summary_ranges(nums) do
    Enum.reduce(nums, {[], nil}, fn n, {chunks, chunk} ->
      case chunk do
        nil -> {chunks, {n, n}}
        {a, b} when n - b == 1 -> {chunks, {a, n}}
        _ -> {[chunk | chunks], {n, n}}
      end
    end)
    |> then(fn n -> if n == nil, do: [], else: n end)
    |> then(fn {chunks, chunk} -> [chunk | chunks] end)
    |> Enum.reverse()
    |> Enum.map(fn {a, b} -> if a == b, do: "#{a}", else: "#{a}->#{b}" end)
  end
end
