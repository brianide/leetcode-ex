defmodule Solution do
  @modulo 1000000007

  @spec count_nice_pairs(nums :: [integer]) :: integer
  def count_nice_pairs(nums) do
    Enum.map(nums, &(&1 - rev(&1)))
    |> Enum.reduce({%{}, 0}, fn n, {freq, total} ->
      total = total + Map.get(freq, n, 0)
      freq = Map.update(freq, n, 1, &(&1 + 1))
      {freq, total}
    end)
    |> then(&(Kernel.elem(&1, 1) |> rem(@modulo)))
  end

  def rev(a), do: rev(a, 0)
  def rev(0, n), do: n
  def rev(a, n), do: rev(div(a, 10), n * 10 + rem(a, 10))
end
